import { Application } from "@hotwired/stimulus"
import '@doabit/semantic-ui-sass'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

