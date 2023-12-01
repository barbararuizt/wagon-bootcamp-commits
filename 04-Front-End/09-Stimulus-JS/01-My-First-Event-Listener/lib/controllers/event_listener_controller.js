// lib/controllers/event_listener_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["btn"]

  connect() {
    console.log("Hola");
  }

  disable() {
    this.btnTarget.innerText = "LO LOGRASTE";
  }
}
