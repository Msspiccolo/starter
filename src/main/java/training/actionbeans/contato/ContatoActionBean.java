package training.actionbeans.contato;

import java.util.ArrayList;
import java.util.List;
import lombok.Getter;
import lombok.Setter;
import lombok.val;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;
import net.sourceforge.stripes.integration.spring.SpringBean;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidateNestedProperties;
import training.actionbeans.BaseActionBean;
import training.mapper.ContatoMapper;
import training.model.Contato;

@UrlBinding("/cadastro.action")
public class ContatoActionBean extends BaseActionBean {

    @Getter
    final List<String> estadosCivis = inicializaEstadosCivis(); // Sera acessado pelo formPet.jsp


    @Getter
    List<Contato> contatosList; // Será acessado pelo listaPet.jsp

    @SpringBean
    ContatoMapper contatoMapper; // vai salvar o contato no BD

    @Getter
    @Setter
    @ValidateNestedProperties({
        @Validate(field = "nome", required = true, on = "salvar", maxlength = 100),
        @Validate(field = "telefone", required = true, on = "salvar", maxlength = 30),
        @Validate(field = "estadoCivil", required = true, on = "salvar")

    })
    Contato contato; // vai receber dados dos form

    @Getter
    @Setter
    Contato filtro; // filtros da tela de listagem

    /**
     * Espera que o objeto filtro venha preenchido com os campos a
     * serem usados para filtrar os resultados que serao exibidos.
     *
     * @return Pagina com lista de contatos.
     */
    @DefaultHandler
    public Resolution exibeLista() {
        contatosList = contatoMapper.listaPorExemplo(filtro);
        return new ForwardResolution("/WEB-INF/jsp/contato/listaContatos.jsp");
    }

    /**
     * Noa precisa de nenhuma informacao extra. Exibe formulario de insercao.
     *
     * @return Pagina com formulario em branco para ser preenchido.
     */
    public Resolution preparaInserir() {
        return new ForwardResolution("/WEB-INF/jsp/contato/formContato.jsp");
    }

    /**
     * Precisa que o idContato venha preenchido no objeto contato da ActionBean
     *
     * @return Pagina com formulario preenchido para ser editado.
     */
    public Resolution preparaEditar() {
        contato = contatoMapper.buscaPorId(contato.getIdContato());
        return new ForwardResolution("/WEB-INF/jsp/contato/formContato.jsp");
    }

    /**
     * Salva os dados e redireciona para o DefaultHandler da propria ContatoActionBean.
     *
     * @return redirect para o DefaultHandler da propria ContatoActionBean.
     */
    public Resolution salvar() {
        if (contato.getIdContato() == null) {

            // Se nao tiver um ID -> insere
            contatoMapper.insere(contato);

            addSimpleMessage("Cadastro cliente criado com sucesso!");

        } else {

            // Se tiver um ID -> atualiza
            contatoMapper.atualiza(contato);

            addSimpleMessage("Cadastro cliente atualizado com sucesso!");
        }

        return new RedirectResolution(ContatoActionBean.class); // Volta para o DefaultHandler da propria classe
    }

    /**
     * Precisa que o idContato venha preenchido no objeto contato da ActionBean
     *
     * @return redirect para o DefaultHandler da propria ContatoActionBean.
     */
    public Resolution excluir() {
        // Redirect para evitar efeitos do refresh de paginas
        // Redireciona para o DefaultHandler da propria ContatoActionBean

        contatoMapper.remove(contato);

        addSimpleMessage("Cliente removido com sucesso!");

        return new RedirectResolution(ContatoActionBean.class);
    }



    private List<String> inicializaEstadosCivis() {
        val estadosCivis = new ArrayList<String>();
        estadosCivis.add("Solteiro");
        estadosCivis.add("Casado");
        estadosCivis.add("Divorciado");
        estadosCivis.add("Viuvo");
        return estadosCivis;
    }
}
