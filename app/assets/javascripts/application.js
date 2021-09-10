// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


/*global $*/
/*global IntersectionObserver*/
/*global activatePagination*/
/*global requestAnimFrame*/
/*global Rails*/


// $(document).addEventListener('turbolinks:load',function(){
//   $('.search__form__input').on('keyup', function(e){
//         Rails.fire($(".search__form")[0], "submit");
//     });
// });

$(document).on('turbolinks:load', function() {
  $(document).on('input', '.search__form__input', function(){
    // tbodyの中身を一度空にする
    $('#index').html('');
    // 検索ワードの取得
    const keyword = $(this).val();
    // #indexにajax通信
    $.ajax({
      type: 'GET',
      url: '/student_posts',
      data: {keyword},
      dataType: 'json'
    })
    .done(function(data){
      data.forEach(function(data){
        const html = `

            ${data.body}
            ${data.title}
            ${data.status}
            ${data.field}

        `;
        $('#index').prepend(html);
      });
    })
  });
});