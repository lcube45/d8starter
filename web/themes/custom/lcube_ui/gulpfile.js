var gulp = require('gulp');
var sass = require('gulp-sass');
var livereload = require('gulp-livereload');

gulp.task('css', function(){
    return gulp.src('scss/style.scss')
        .pipe(sass())
        .pipe(gulp.dest('css'))
        .pipe(livereload());
});

gulp.task('watch', function (){
    livereload.listen();
    gulp.watch('scss/**/*.scss', gulp.series('css'));
    gulp.watch('css/style.css', function (files){
        livereload.changed(files)
    });
})