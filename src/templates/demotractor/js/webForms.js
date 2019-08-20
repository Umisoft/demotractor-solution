/**
 * Модуль формы обратной связи
 * @type {{validate: site.webForms.validate}}
 */
site.webForms = {

	/**
	 * Валидирует заполнение полей формы
	 * @param {HTMLElement} form форма
	 * @returns {Boolean}
	 */
	validate: function(form) {
		var that = this;
		var $form = $(form);
		var errorOccurred = false;
		var success = true;

		$('div.required', $form).each(function() {
			var $fieldContainer = $(this);
			var $inputContainer = $('div.field_div', $fieldContainer);

			if ($inputContainer.length > 0) {
				errorOccurred = that.checkRequiredFields($inputContainer);

				if (errorOccurred) {
					success = false;
				}

				that.toggleEmptyRequiredFieldMessage(errorOccurred, $fieldContainer);
			}

			if ($fieldContainer.hasClass('field_email')) {
				errorOccurred = that.checkEmailField($inputContainer);

				if (errorOccurred) {
					success = false;
				}

				that.toggleIncorrectEmailFieldMessage(errorOccurred, $fieldContainer);
			}

			if ($fieldContainer.hasClass('accept_pdn')) {
				errorOccurred = $('input[type = "checkbox"]', $fieldContainer).is(":checked") === false;

				if (errorOccurred) {
					success = false;
				}

				that.toggleEmptyRequiredFieldMessage(errorOccurred, $fieldContainer);
			}
		});

		return success;
	},

	/**
	 * Проверяет заполнено ли обязательное поле
	 * @param {jQuery} $inputContainer контейнер со значением поля формы
	 * @returns {Boolean}
	 */
	checkRequiredFields: function($inputContainer) {
		var value = $inputContainer.hasClass('input') ? $('input', $inputContainer).val() : $('textarea', $inputContainer).val();
		return (typeof value !== 'string' || value.length === 0);
	},

	/**
	 * Проверяет корректность заполнения почтового ящика
	 * @param {jQuery} $inputContainer контейнер со значением поля формы
	 * @returns {Boolean}
	 */
	checkEmailField: function($inputContainer) {
		return $('input', $inputContainer).val().toString().match(/.+\@.+\..+/) === null;
	},

	/**
	 * Переключает отображение сообщения об ошибке заполнения обязательного поля
	 * @param {Boolean} errorOccurred определяется произошла ли ошибка
	 * @param {jQuery} $fieldContainer контейнер поля
	 */
	toggleEmptyRequiredFieldMessage: function(errorOccurred, $fieldContainer) {
		if (errorOccurred) {
			$fieldContainer.addClass('verification_error');
			return;
		}

		$fieldContainer.removeClass('verification_error');
	},

	/**
	 * Переключает отображение сообщения об ошибке заполнения поля с почтовым ящиком
	 * @param {Boolean} errorOccurred определяется произошла ли ошибка
	 * @param {jQuery} $fieldContainer контейнер поля
	 */
	toggleIncorrectEmailFieldMessage: function(errorOccurred, $fieldContainer) {
		if (errorOccurred) {
			$fieldContainer.addClass('email_verification_error');
			return;
		}

		$fieldContainer.removeClass('email_verification_error');
	}
};