import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  // connect() {
  //   console.log("connected");
  // }

  closeModal(e){
    if (e.detail.success){
      this.element.remove();
    }
    // console.log(e.detail.success);
  }
}
