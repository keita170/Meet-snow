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
/*global appendErrMsgToHTML*/
/*global appendUser*/




$(document).on('turbolinks:load', function(){
  const inputForm = $('.search__form__input');
  const url = location.href;
  const searchResult = $('#index');

  function builtHTML(data){
    let html = `
     <div class="card mb-2" style="width: 42rem;">
      <div class="card-body">
        <h5 class="card-title">
          <a href="student_posts/${data.id}">${data.field}</a>:
          <script>
          if (${data.status} == "受付中") {
           <p>受付中</p>
          }else{
            <p>受</p>
          }
          </script>
        </h5>
        <p class="card-text">${data.body}</p>
        <div class="text-muted mb-1">
          <span>条件:${data.title}</span>

        </div>
      </div>
    </div>
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


// $(document).on('turbolinks:load', function(){

//     var search_list = $("#index");
//     var member_list = $("#member-append");

//     function appendUser(student_post){
//         var html =
//                     `<div class="chat-group-student_post clearfix">
//                         </div>`;
//                     search_list.append(html);
//     }

//     function appendErrMsgToHTML(msg){
//         var html =
//                     `<div class="chat-group-student_post clearfix">
//                         <p class="chat-group-student_post__title">${msg}</p>
//                     </div>`;
//                     search_list.append(html);
//     }

//   $('.search__form__input').on('keyup', function(e){
//         var input = $(".search__form__input").val();

//         $.ajax({
//             type: 'GET',                // HTTPメソッドはGETで
//             url:  '/student_posts/serach',             // /student_postsのURLに (これによりstudent_postsコントローラのindexアクションが起動)
//             data: { keyword: input},    // keyword: inputを送信する
//             dataType: 'json'            // サーバから値を返す際はjsonである
//         })

//         .done(function(student_posts){                // student_postsにjson形式のstudent_post変数が代入される。複数形なので配列型で入ってくる

//             if (input.length === 0) {         // フォームの文字列長さが0であれば、インクリメンタルサーチ結果を表示しないようにする
//                 $('#index').empty();
//               }

//             else if (input.length !== 0){     // 値が等しくないもしくは型が等しくなければtrueを返す。
//                 $('#index').empty();
//                 student_posts.forEach(function(student_post){ // users情報をひとつずつとりだしてuserに代入
//                     appendUser(student_post)
//                 });
//             }

//             else {
//                 $('#index').empty(); // ユーザーが見つからなければ「見つからない」を返す。
//                 appendErrMsgToHTML("一致するユーザーが見つかりません");
//             }
//         })

//         .fail(function() {
//             alert('ユーザー検索に失敗しました');
//         });
//     });
// });

// $(function() {
//   $(".search__form__input").on("keyup", function(){

//     var input = $(".search__form__input").val();

//     $.ajax({
//       type: 'GET',
//       url: '/student_posts/search',
//       data: { keyword: input },
//       dataType: 'json'
//     })

//     .done(function(products) {
//       $("#index").empty();
//       if (products.length !==0) {
//         $("#index").append(


//         );
//       }
//       else {
//         $("#index").append("検索結果がありません");
//       }
//     })
//     .fail(function(){
//       alert('映画検索に失敗しました');
//     })
//   });
// });