import { Controller } from "stimulus"
import { leave, toggle } from 'el-transition'

export default class extends Controller {
  static targets = [ 'menu' ]

  connect() {
    this.toggleClass = this.data.get('class') || 'hidden'
  }

  toggle(event) {
    if (event.target.id != 'delete_user'){
      toggle(this.menuTarget, 'dropdown')
    }
  }

  hide(event) {
    if (
      this.element.contains(event.target) === false &&
      !this.menuTarget.classList.contains(this.toggleClass)
    ) {
      leave(this.menuTarget, 'dropdown')
    }
  }

  openSlide(e) {
    e.preventDefault();

    if (this.slideController) {
      this.menuTarget.classList.add(this.toggleClass)
      this.slideController.open()
    }
  }

  get slideController() {
    return this.application.controllers.find(controller => {
      return controller.context.identifier === 'slide';
    });
  }
}
