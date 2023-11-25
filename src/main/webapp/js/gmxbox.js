//fecha modal
function fecharGmxBox() {
	$(".modalGmx").modal("hide");
};

//fecha modal
function fecharModalGmx() {
	fecharGmxBox();
}

function fecharGmxboxOffline() {
	fecharGmxBox();
	deleteGmxBoxOffline();
}

delete ID_OFFLINE;
var ID_OFFLINE = "gmxbox-offline";

/**
 * Apaga a gmxBoxShowOffline do DOM.
 */
function deleteGmxBoxOffline() {
	const gmxboxAtiva = document.querySelector('.' + ID_OFFLINE);
	const gmxboxThirdParty = document.querySelector(".modalGmx");

	if (gmxboxAtiva) {
		gmxboxAtiva.remove();
	}

	if (gmxboxThirdParty) {
		gmxboxThirdParty.remove();
	}
}

function geraCabecalho(title) {
	const header = document.createElement("div");
	header.className = "modal-header";

	const botaoFechar = document.createElement("button");
	botaoFechar.type = "button";
	botaoFechar.className = "close close-gmx-box";
	botaoFechar.onclick = () => fecharModalGmx();
	botaoFechar.innerText = "x";

	const titulo = document.createElement("h4");
	titulo.className = "modal-title";
	titulo.innerText = title;

	header.appendChild(botaoFechar);
	header.appendChild(titulo);
	return header;
}

/**
 * Mostra uma nova gmxbox offline na tela sem a adição de requisição.
 *
 * @param title Titulo a ser apresentado na box.
 * @param conteudoCorpo HTMLElement que será adicionado ao corpo do gmxbox.
 */
function gmxBoxShowOffline({
		titulo,
		conteudoCorpo,
		onclose,
		id
}) {
	deleteGmxBoxOffline();
	criaLoader();

	const gmxbox = document.createElement("div");
	gmxbox.id = id;
	gmxbox.className = "modalGmx modal fade" + ID_OFFLINE;
	gmxbox.role = "dialog";

	const geral = document.createElement("div");
	geral.className = "modal-dialog modal-lg";

	const conteudo = document.createElement("div");
	conteudo.className = 'modal-content';

	const corpo = document.createElement("div");
	corpo.className = "modal-body";
	corpo.appendChild(conteudoCorpo);

	conteudo.appendChild(geraCabecalho(titulo));
	conteudo.appendChild(corpo);

	geral.appendChild(conteudo);
	gmxbox.appendChild(geral);

	jQuery("body").append(gmxbox);
	$("#" + id).modal("show");
	$("#" + id).on('hidden.bs.modal', onclose);

	removerLoader();
}

/**
 * Adiciona loader na tela.
 */
function criaLoader() {
	jQuery("body").append("<div class='gmxBoxLoader'><div></div></div>");
}

function removerLoader() {
	jQuery("div.gmxBoxLoader").remove();
}

//criar modal
function gmxBoxShow(request, title, idModal) {
	if($('.modalGmx').size() > 0){
		$('.modal-title').text(title);
		$("body").append("<div class='gmxBoxLoader'><div></div></div>");
		// obtem o conteudo para o modal
		jQuery.ajax({
			async : false,
			contentType : 'text/html',
			url : request,
			type : 'GET',
			datatype : 'html',
			success : function(data) {
				if (data.indexOf("null") != -1 && data.length < 10) {
					window.location.reload();
					return;
				}

				if(data.indexOf('<html') != -1){
					data = $.parseHTML(data);
				}
				$('.modalGmx .modal-body').html(data);

				// destruir loader
				removerLoader();

				$(".modalGmx").modal("show");

				// Para chamadas em cadeia com mais de 2 niveis dentro da gmxBox
				$('.modalGmx .modal-body .gmxbox').click(function(e){
						//chama link via ajax
			    	    var request = jQuery(this).attr('href');
			    	    var title = jQuery(this).attr('title');
			    	    if (title == null) {
			    	    	var title = " ";
			    	    }
			    	    var idModal = 'modal' + $(this).attr('id');
			        	gmxBoxShow(request, title, idModal);

			    	    return false;
			      });

				if(typeof fallBackGmxBox == 'function'){
					fallBackGmxBox();
				}
				return false;
			}
		});
	}else{
		// criar a div
		$("body").append('<div id="'+idModal+'" class="modalGmx modal fade" role="dialog">'+
			'<div class="modal-dialog modal-lg">'+
			'<div class="modal-content">'+
			'<div class="modal-header">'+
			'<button type="button" class="close close-gmx-box" onclick="fecharModalGmx()">&times;</button>'+
			'<h4 class="modal-title"></h4></div>'+
			'<div class="modal-body"></div>'+
			'</div></div></div>');
		$(".modalGmx .modal-title").text(title);
		//cria o loader
	  jQuery("body").append("<div class='gmxBoxLoader'><div></div></div>");
	  //obtem o conteudo para o modal
	  jQuery.ajax({
	    async: false,
	    contentType: 'text/html',
	    url : request,
	    type: 'GET',
	    datatype: 'html',
	    success: function(data) {
	      if (data.indexOf("null") != -1 && data.length < 10) {
	        window.location.reload();
	        return;
	      }

	      if(data.indexOf('<html') != -1){
	    	  data = $.parseHTML(data);
	      }

	      $("#"+idModal+" .modal-body").html(data);
	      $(".modalGmx").modal("show");

	      //destruir loader
				removerLoader();
	      // Fecha modalGmx ao apertar ESC
	      jQuery(document).keyup(function(event) {
	        var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	        if (keyCode == 27) {
	          fecharModalGmx();
	        }
	      });

	      $('.modalGmx .modal-body .gmxbox').click(function(e){
	    	//chama link via ajax
	    	    var request = jQuery(this).attr('href');
	    	    var title = jQuery(this).attr('title');
	    	    if (title == null) {
	    	    	var title = " ";
	    	    }
	    	    gmxBoxShow(request, title);
	    	    return false;
	      });

	      if(typeof fallBackGmxBox == 'function'){
	  		fallBackGmxBox();
	  	  }
	      return false;
	    }
	  });
	}
}

$(document).ready(function() {
	init_event_gmx();
});

function init_event_gmx(){
  $('body').off('click', ".gmxbox");
  $('body').on('click', ".gmxbox", function() {
    //chama link via ajax
    var request = jQuery(this).attr('href');
    var title = jQuery(this).attr('title');
    if (title == null) {
    	var title = " ";
    }
    if($('.modalGmx').size() > 0){
    	gmxBoxShow(request, title);
    }else{
    	var idModal = 'modal' + $(this).attr('id');
    	gmxBoxShow(request, title, idModal);
    }

    return false;
  });
}
