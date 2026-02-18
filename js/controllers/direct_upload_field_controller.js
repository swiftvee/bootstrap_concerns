import { Controller } from "@hotwired/stimulus"

// https://edgeguides.rubyonrails.org/active_storage_overview.html#direct-upload-javascript-events
class DirectUploadFieldController extends Controller {
  connect() {
    this.progressBars = {}
  }

  setup(event) {
    const { id, file } = event.detail

    if (!this.wrapper) {
      this.wrapper = document.createElement("div")
      this.wrapper.className = "d-flex flex-wrap gap-2 mb-2"
      this.element.insertAdjacentElement("beforebegin", this.wrapper)
    }

    const progress = document.createElement("div")
    progress.className = "progress"
    const progressBar = document.createElement("div")
    progressBar.className = "progress-bar progress-bar-striped progress-bar-animated overflow-visible px-3"
    progressBar.style.width = "0%"
    progressBar.textContent = file.name
    this.wrapper.appendChild(progress)
    progress.appendChild(progressBar)
    this.progressBars[id] = progressBar
  }

  progress(event) {
    const { id, progress } = event.detail

    const progressBarStyle = this.#progressBar(id).style
    if (progressBarStyle.width === "100%") return // The progress events may be dispatched out of order.

    progressBarStyle.width = `${progress}%`
  }

  error(event) {
    event.preventDefault()

    const { id, error } = event.detail

    const progressBar = this.#progressBar(id)
    progressBar.classList.add("bg-danger")
    progressBar.textContent = error
  }

  end(event) {
    this.#progressBar(event.detail.id).classList.add("bg-success")
  }

  #progressBar(id) {
    return this.progressBars[id]
  }
}

export default function (application) {
  application.register("direct-upload-field", DirectUploadFieldController)
}
