// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery/src/jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
import '../skippr.min.js'

//Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(function() {
  $('#theTarget').skippr({
    dots: true,
    speed: 1000,
    autoPlay: true,
    autoPlayDuration: 3000,
    transition: 'slide',
    arrows: true,
  });
});