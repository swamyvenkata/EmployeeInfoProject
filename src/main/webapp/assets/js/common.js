
/**
 * Script to show progress animation
 */
function showProgressAnimation(){
    $("#loading-div-background").show();
}

function closeProgressAnimation(){
	$("#loading-div-background").hide();
}

function openNewUnBalanedDTRs(){
	//alert('hi');
	showProgressAnimation();
	window.location = "dtrneutralcurrents";
}

function opendtravgabstract(){
	showProgressAnimation();
	window.location = "dtravgabstract";
}

function enableEditProfile(studentId){
	showProgressAnimation();
	window.location = 'editapplication?SID='+studentId;
}

function printPage(){
	alert('test printing');
	document.print();
}

function admissionUpdate(){
	showProgressAnimation();
	window.location = "addadmissionnumbers";
}

function generateHallticket(){
	showProgressAnimation();
	window.location = "hallticketadmissions";
}


function subjectentryform(){
	showProgressAnimation();
	window.location = "subjectentryform";
}


function getCombobox(url, id, selected, prependlist, funccall) {
	$.ajax({
		url : url,
		type : 'get',
		success : function(data) {
			processCombo(id, data, selected, prependlist, funccall);
		}
	});
}
function processCombo(comboName, data, selected, prependlist, funccall) {
	$('#' + comboName).html(data);
	var selVal = $('#' + comboName).attr("data-selected")
	if($('#' + comboName).is("input[type='text']")){
		$('#' + comboName).val(data);
	}
	else{
		
	}
	if (typeof funccall == 'function') {
		funccall(prependlist+data,selVal);
	}
}


function showMessage(msg, mode) {
	$.notify(msg, mode);
}

function removeBgCurtain() {
	$.unblockUI();
	//$(document).ajaxStop($.unblockUI);
}

function bgCurtain() {
	$.blockUI({
				message : '<img height="32px" width="32px" src="/MeterInspect/resources/assets/images/gallery/Preloader_3.gif" /> &nbsp; &nbsp;Just a moment...',
				css : {
					border : 'none',
					backgroundColor : '#000',
					padding : '5px',
					'-webkit-border-radius' : '10px',
					'-moz-border-radius' : '10px',
					opacity : .5,
					color : '#fff',
					'-webkit-border-radius' : '10px',
					'-moz-border-radius' : '10px'
				}
			});
}

function genericComboBoxFilterByText(selectBox, name, class_name) {
	return selectBox.each(function() {
		var $select = selectBox;
		var options = [];
		$($select).find('option').each(function() {
			options.push({
				value : $(this).val(),
				text : $(this).text()
			});
		});

		$($select).data('options', options);
		var $this = $.fn.parents($select);

		// $($select).bind('click mouseup mousedown',function(e,t){
		var listId = 'dataListComboBox_'+name;
		var $dataListComboBoxinput = listId + name + 'inputId';
		var $this = $("<div>");

		$select.before($this);
		$select.appendTo($this);

		var $input = $('<input class="' + class_name + '" name="'
				+ $dataListComboBoxinput + '" required />');
		$this.after($input);
		var $dataList = $('<datalist>');
		$input.after($dataList);
		$($input).attr('list', listId);
		$($input).attr('id', $dataListComboBoxinput);
		$($dataList).attr('id', listId);

		var options = $($select).data('options');
		var dataListOptions = '';
		$.each(options, function(i) {
			var option = options[i];
			dataListOptions += '<option data-value="' + option.value + '" value="'
					+ option.text + '" data-selected></option>';
		});
		$($select).hide();
		$(getIdFromString(listId)).html(dataListOptions);

		var flag = false;
		$(getIdFromString($dataListComboBoxinput)).on('focusout', function() {
			var val = this.value;
			var $data_value;
			$('#' + listId + ' option').each(function() {
				$data_value = $(this).attr('data-value');
				if (this.value === val) {
					$(selectBox).val($data_value).attr("selected", "selected");
					flag = false;
					return false;
				} else if (this.value != val) {
					flag = true;
				}
			});

			if (flag) {
				// setTimeout(showMessage("Typed value should be in the list",
				// "error"), 5000);
				$(getIdFromString($dataListComboBoxinput)).val('');
			}

		});

		if ($($select).find(' option:selected').length > 0) {
			$(getIdFromString($dataListComboBoxinput)).val(
					$($select).find(' option:selected').text());
			$('#' + listId + ' option').attr('data-selected',
					$($select).find(' option:selected').val());
		}
	});
	}
	


var modalDialog = null;
function getModalDialog(size, title, data, buttons, shownFunctions,
		hiddenFunctions, flag,escapfunction) {
	var btns = {};
	if (buttons && buttons.length > 0)
		for (i = 0; i < buttons.length; i++) {
			btns[buttons[i]["type"]] = {
				label : buttons[i]["label"] ? buttons[i]["label"] : null,
				className : buttons[i]["className"] ? buttons[i]["className"]
						: "default",
				callback : buttons[i]["callback"] ? buttons[i]["callback"]
						: null
			};
		}
	modalDialog = bootbox.dialog({
		size : size,
		title : title + " ",
		show : false,
		message : data,
		onEscape : function() {
			if(escapfunction &&typeof escapfunction==='function'){
				escapfunction();
				return false;
			}
			
		},
		buttons : btns
	});

	modalDialog.on('shown.bs.modal', function() {
		if (shownFunctions) {
			shownFunctions();
		}
	});

	modalDialog.on('hidden.bs.modal', function() {
		if (hiddenFunctions) {
			hiddenFunctions();
		}
		modalDialog = null;
	});
	
	modalDialog.modal('show');
}
var modalConfirm;
function getConfirmDialog(title, message, yesCallback, noCallBack) {
	modalConfirm = bootbox
			.confirm(
					{
						message : message,
						title : title,
						buttons : {
							confirm : {
								label : "<span class='glyphicon glyphicon-ok-circle' aria-hidden='true'></span>Yes",
								className : "btn btn-sm btn-default",
							},
							cancel : {
								label : "<span class='glyphicon glyphicon-remove-circle' aria-hidden='true'></span>No",
								className : "btn btn-sm btn-default",
							},
						},
						callback : function(result) {
							if (result && yesCallback) {
								yesCallback();
							} else if (noCallBack) {
								noCallBack();
							}
						}
					}).init(function() {

			}).on('hidden.bs.modal', function(e) {

				 //$(document.body).addClass('modal-open');

			});

	modalConfirm.on('hidden.bs.modal', function(e) {
		if (modalDialog) {
			$(document.body).addClass('modal-open');
		}
	});
	/*if (modalDialog) {
		modalDialog.on('hidden.bs.modal', function() {
			$(document.body).removeClass('modal-open');
		});
	} else {
		$(document.body).addClass('modal-open');
	}*/
	$(" .bootbox-confirm .modal-footer button").css({
		"float" : "right",
		"margin-left" : "10px"
	});
}


