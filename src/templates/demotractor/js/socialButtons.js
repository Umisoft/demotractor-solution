/**
 * Модуль кнопок социальных сетей
 * @type {{open: (function(*): boolean)}}
 */
site.socialButtons = {

	/**
	 * Открывает окно для шеринга страницы в выбранной социальной сети
	 * @param {String} name имя социальной сети
	 * @returns {Boolean}
	 */
	open: function(name) {
		var title = encodeURIComponent(document.title);
		var url = encodeURIComponent(location.href);
		var href = '';

		switch (name) {
			case 'social_vk': {
				href = 'https://vkontakte.ru/share.php?url=' + url;
				break;
			}
			case 'social_odnoklassniki': {
				href = 'https://connect.ok.ru/offer?url=' + url + '&title=' + title;
				break;
			}
			case 'social_mir': {
				href = 'https://connect.mail.ru/share?url=' + url + '&title=' + title;
				break;
			}
			case 'social_twitter': {
				href = 'https://twitter.com/home?status=' + title + '+' + url;
				break;
			}
			case 'social_livejournal': {
				href = 'https://www.livejournal.com/update.bml?event=' + url + '&subject=' + title;
				break;
			}
		}
		window.open(href, '_blank', 'width=640, height=480');
		return false;
	}
};