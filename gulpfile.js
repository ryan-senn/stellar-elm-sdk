var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('default', [
    'sass',
    'publish',
]);

gulp.task('watch', [
    'sass:watch',
]);

gulp.task('sass', () => {
    return gulp.src('./style.scss')
        .pipe(sass())
        .on('error', function (err) {
            console.log(err);
        })
        .pipe(gulp.dest('docs'))
});

gulp.task('sass:watch', () => {
    gulp.watch('./**/*.scss', ['sass']);
});

gulp.task('publish', () => {

    const files = [
        "node_modules/clipboard/dist/clipboard.min.js",
    ];

    files.map(source => {
        return gulp.src(source).pipe(gulp.dest("docs"));
    });
});