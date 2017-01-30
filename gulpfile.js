var gulp        = require("gulp");
var gutil       = require("gulp-util");
var concatenate = require("gulp-concat");
var minify      = require("gulp-uglify");
var bower       = require("main-bower-files");
var filter      = require('gulp-filter');

// write compiled dist files into `target/dist`
var dest = ".";
var libs = ["3rdparty/inflate.min.js", "js/localstorage.js", "js/weechat.js", "js/irc-utils.js", "js/glowingbear.js", "js/settings.js", "js/utils.js", "js/notifications.js", "js/filters.js", "js/handlers.js", "js/connection.js", "js/file-change.js", "js/imgur-drop-directive.js", "js/whenscrolled-directive.js", "js/inputbar.js", "js/plugin-directive.js", "js/websockets.js", "js/models.js", "js/bufferResume.js", "js/plugins.js", "js/imgur.js", "3rdparty/favico-0.3.10.min.js"];

gulp.task("default", ["compile"]);

gulp.task("compile", function() {
  return gulp.src(bower().concat(libs))
    .pipe(filter(["**/*.js"]))
    .pipe(concatenate("all-min.js"))
    .pipe(minify())
    .pipe(gulp.dest(dest));
});

