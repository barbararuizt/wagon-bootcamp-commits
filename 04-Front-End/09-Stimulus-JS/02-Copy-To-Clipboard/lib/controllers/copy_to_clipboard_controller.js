import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["data", "btn"]

  connect() {
    console.log(this.dataTarget.value)
    // TODO: console.log something!
  }

  copy() {
    navigator.clipboard.writeText(this.dataTarget.value);
    this.btnTarget.innerText = "Copied!"
  }
}