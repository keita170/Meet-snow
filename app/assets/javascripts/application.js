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
/*global searchResult*/
/*global url*/
/*global location*/


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
      url: '/student_posts/search',
      data: {keyword},
      dataType: 'json'
    })
    .done(function(data){
      data.forEach(function(data){
        const html = `

            ${data.body}

        `;
        $('#index').prepend(html);
      });
    })
  });
});

// function buildHTML(dataFromSearchFunction){
//     let html = `
//     <li>${dataFromSearchFunction.name}</li>
//     `
//     searchResult.append(html);
//   }

//   // 該当するデータがなかった時に呼ばれる関数
//   function NoResult(message){
//     let html = `
//     <li>${message}</li>
//     `
//     searchResult.append(html);
//   }

//   function search(target){
//     $.ajax({
//       type: 'GET',
//       url: '/student_posts/search',
//       data: {key: target},
//       dataType: 'json'
//     })
//     .done(function(data){
//       // 通信が成功した時の処理
//       searchResult.empty(); //再度検索した際に前のデータを消す処理
//       if (data.length !== 0) {
//         data.forEach(function(data) { //dataは配列型に格納されているのでEach文で処理
//           buildHTML(data)
//         });
//       } else {
//         NoResult('該当する商品はありません')
//       }
//     })
//     .fail(function(data){
// 　　　// 通信が失敗した時の処理
//       alert('非同期通信に失敗しました');
//     })
//   }
$(document).on('turbolinks:load', function(){
  const inputForm = $('.search__form__input');
  const url = location.href;
  const searchResult = $('#index');

  function builtHTML(data){
    let html = `
    <li>${data.body}</li>
    `
    searchResult.append(html);
  }

  function NoResult(message){
    let html = `
    <li>${message}</li>
    `
    searchResult.append(html);
  }

  // フォームに入力すると発火する
  inputForm.on('keyup', function(){
    const target = $(this).val();
    search(target);
  });

  // ajax処理
  function search(target){
    $.ajax({
      type: 'GET',
      url: '/student_posts/search',
      data: {keyword: target},
      dataType: 'json'
    })
    .done(function(data){
      searchResult.empty(); //再度検索した際に前のデータを消す処理
      if (data.length !== 0) {
        data.forEach(function(data) { //dataは配列型に格納されているのでEach文で回す
          builtHTML(data)
        });
      } else {
        NoResult('該当する商品はありません')
      }
    })
    .fail(function(data){
      alert('非同期通信に失敗しました');
    })
  }
});