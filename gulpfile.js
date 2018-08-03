var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('default', [
    'publish',
]);

gulp.task('publish', () => {

    const files = [
        "node_modules/clipboard/dist/clipboard.min.js",
        "node_modules/highlightjs/highlight.pack.min.js",
        "node_modules/highlightjs/styles/arta.css",
    ];

    files.map(source => {
        return gulp.src(source).pipe(gulp.dest("docs/vendors"));
    });
});