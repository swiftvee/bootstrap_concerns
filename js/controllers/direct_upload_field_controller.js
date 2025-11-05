import { Controller } from "@hotwired/stimulus"

// https://edgeguides.rubyonrails.org/active_storage_overview.html#direct-upload-javascript-events
class DirectUploadFieldController extends Controller {
  connect() {
    this.progressBars = {}
  }

  setup(event) {
    const { id, file } = event.detail

    const progress = document.createElement("div")
    progress.className = "progress mb-2"
    const progressBar = document.createElement("div")
    progressBar.className = "progress-bar progress-bar-striped progress-bar-animated overflow-visible"
    progressBar.style.width = "0%"
    progressBar.textContent = file.name
    progress.appendChild(progressBar)

    this.element.insertAdjacentElement("beforebegin", progress)
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
