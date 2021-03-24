import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "banner"]

  connect() {
    this.toggleClass = this.data.get('class') || 'hidden'
  }

  hide(event) {
    this.bannerTarget.classList.add(this.toggleClass)
  }
}
