{* Note: we can use general variables names here since this template is parsed within its own scope *}

	{option:successMessage}<div class="alert alert-success">{$successMessage}</div>{/option:successMessage}
	{option:formBuilderError}<div class="alert alert-danger"><p>{$formBuilderError}</p></div>{/option:formBuilderError}

	{option:fields}
		<form {option:hidUtf8}accept-charset="UTF-8" {/option:hidUtf8}id="{$formName}" method="post" action="{$formAction}">
			{option:formToken}
				<input type="hidden" name="form_token" id="formToken{$formName|ucfirst}" value="{$formToken}" />
			{/option:formToken}

			<input type="hidden" name="form" value="{$formName}" />

			{iteration:fields}
				{* Headings and paragraphs *}
				{option:fields.plaintext}
					<div class="content">
						{$fields.html}
					</div>
				{/option:fields.plaintext}

				{* Input fields, textareas and drop downs *}
				{option:fields.simple}
					<p{option:fields.error} class="alert alert-danger"{/option:fields.error}>
						<label for="{$fields.name}">
							{$fields.label}{option:fields.required}<abbr title="{$lblRequiredField}">*</abbr>{/option:fields.required}
						</label>
						{$fields.html}
						{option:fields.error}<span class="formError inlineError">{$fields.error}</span>{/option:fields.error}
					</p>
				{/option:fields.simple}

				{* Radio buttons and checkboxes *}
				{option:fields.multiple}
					<div class="inputList{option:fields.error} alert alert-danger{/option:fields.error}">
						<label>
							{$fields.label}{option:fields.required}<abbr title="{$lblRequiredField}">*</abbr>{/option:fields.required}
						</label>
						<ul>
							{iteration:fields.html}
								<li><label for="{$fields.html.id}">{$fields.html.field} {$fields.html.label}</label></li>
							{/iteration:fields.html}
						</ul>
						{option:fields.error}<span class="formError inlineError">{$fields.error}</span>{/option:fields.error}
					</div>
				{/option:fields.multiple}
			{/iteration:fields}

			<p>
				<input type="submit" value="{$submitValue}" name="submit" class="btn btn-primary" />
			</p>
		</form>
	{/option:fields}