/* eslint-disable import/extensions */
import { Application } from "@hotwired/stimulus";

// TODO: Import the Stimulus Controller here

import CopyToClipboardController from "./controllers/copy_to_clipboard_controller.js";

window.Stimulus = Application.start();
window.Stimulus.register("copy-to-clipboard", CopyToClipboardController);
// TODO: Register your Stimulus Controller below
