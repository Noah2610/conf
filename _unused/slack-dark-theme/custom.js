////////////////////////////////////////////////////////////////////////////////
// https://github.com/widget-/slack-black-theme                               //
//                                                                            //
// Append the following code to the files:                                    //
//   /usr/lib/slack/resources/app.asar.unpacked/src/static/index.js           //
//   /usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js     //
////////////////////////////////////////////////////////////////////////////////

// CUSTOM DARK THEME //
// First make sure the wrapper app is loaded
document.addEventListener("DOMContentLoaded", function() {
  // Then get its webviews
  let webviews = document.querySelectorAll(".TeamView webview");

  // Fetch our CSS in parallel ahead of time
  const cssPath = 'https://cdn.rawgit.com/widget-/slack-black-theme/master/custom.css';
  let cssPromise = fetch(cssPath).then(response => response.text());
  let customCustomCSS = `
    :root {
      --primary:             #61AFEF;
      --text:                #ABB2BF;
      --background:          #282C34;
      --background-elevated: #3B4048;
    }
  `

  // Insert a style tag into the wrapper view
  cssPromise.then(css => {
    let s = document.createElement('style');
    s.type = 'text/css';
    s.innerHTML = css + customCustomCSS;
    document.head.appendChild(s);
  });

  // Wait for each webview to load
  webviews.forEach(webview => {
    webview.addEventListener('ipc-message', message => {
      if (message.channel == 'didFinishLoading')
        // Finally add the CSS into the webview
        cssPromise.then(css => {
          let script = `
          let s = document.createElement('style');
          s.type = 'text/css';
          s.id = 'slack-custom-css';
          s.innerHTML = \`${css + customCustomCSS}\`;
          document.head.appendChild(s);
          `
          webview.executeJavaScript(script);
        })
    });
  });
});


////////////////////////////////////////////////////////////////////////////////
// https://github.com/widget-/slack-black-theme/issues/21#issuecomment-342551435
//                                                                            //
// Append the following code to the file:                                     //
//   /usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js     //
////////////////////////////////////////////////////////////////////////////////

document.addEventListener('DOMContentLoaded', function() {
  $.ajax({
    url: 'https://cdn.rawgit.com/laCour/slack-night-mode/master/css/raw/black.css',
    success: function(css) {
      $("<style></style>").appendTo('head').html(css);
    }
  });
});
