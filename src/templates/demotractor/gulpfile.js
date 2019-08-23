/**
 * Сборщик css и js.
 *
 * - Сборка всех ресурсов:
 * $ npm install
 * $ gulp
 *
 * 2) Режим разработки, ресурсы автоматически пересобираются при сохранении исходных файлов:
 * $ gulp watch
 */
var gulp = require('gulp');
var gutil = require('gulp-util');
var plugins = require('gulp-load-plugins')();
var cssmin = require('gulp-cssmin');
var jsmin = require('gulp-minify');
var rename = require('gulp-rename');
var rimraf = require('gulp-rimraf');

var jsLibraries = 'js/lib/**/*.js';
var cssFiles = 'css/*.css';
var colorCssFiles = 'css/color/*.css';
var compiledCss = 'compiled/*.css';
var rimrafCss = 'compiled/*.min.css';
var jsFiles = 'js/*.js';
var compiledJs = 'compiled/*.js';
var rimrafJs = 'compiled/*-min.js';

var destination = 'compiled';

gulp.task('build-css-files', function() {
	return gulp.src(cssFiles)
		.pipe(plugins.plumber())
		.on('error', function(err) {
			gutil.log(err);
			this.emit('end');
		})
		.pipe(plugins.concat('demotractor.css'))
		.pipe(gulp.dest(destination)).on('error', gutil.log);
});

gulp.task('build-css-color-files', function() {
	return gulp.src(colorCssFiles)
		.pipe(plugins.plumber())
		.on('error', function(err) {
			gutil.log(err);
			this.emit('end');
		})
		.pipe(gulp.dest(destination)).on('error', gutil.log);
});

gulp.task('cleancss', function() {
	return gulp.src(rimrafCss, { read: false })
		.pipe(rimraf())
		.on('error', function(err) {
			gutil.log(err);
			this.emit('end');
		});
});

gulp.task('mincss', function () {
	return gulp.src(compiledCss)
		.pipe(cssmin())
		.pipe(rename({suffix: '.min'}))
		.on('error', function(err) {
			gutil.log(err);
			this.emit('end');
		})
		.pipe(gulp.dest(destination));
});

gulp.task('build-js-libraries', function() {
	return gulp.src(jsLibraries)
		.pipe(plugins.concat('demotractor.lib.js'))
		.pipe(gulp.dest(destination));
});

gulp.task('build-js-common', function() {
	return gulp.src(jsFiles)
		.pipe(plugins.concat('demotractor.js'))
		.pipe(gulp.dest(destination));
});

gulp.task('cleanjs', function() {
	return gulp.src(rimrafJs, { read: false })
		.pipe(rimraf())
		.on('error', function(err) {
			gutil.log(err);
			this.emit('end');
		});
});

gulp.task('minjs', function() {
	return gulp.src(compiledJs)
		.pipe(jsmin())
		.on('error', function(err) {
			gutil.log(err);
			this.emit('end');
		})
		.pipe(gulp.dest(destination));
});

gulp.task('watch', function() {
	gulp.watch(cssFiles, ['build-css-files']);
	gulp.watch(jsLibraries, ['build-js-libraries']);
	gulp.watch(jsFiles, ['build-js-common']);
});

gulp.task('compile', gulp.series('cleancss', 'mincss', 'cleanjs', 'minjs', function(done) {
	done();
}));

gulp.task('build', gulp.series('build-css-files', 'build-css-color-files', 'build-js-libraries', 'build-js-common', 'compile', function(done) {
	done();
}));

gulp.task('default', gulp.series('build-css-files', 'build-css-color-files', 'build-js-libraries', 'build-js-common', 'compile', function(done) {
	done();
}));