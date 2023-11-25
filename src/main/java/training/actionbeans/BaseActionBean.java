
package training.actionbeans;

import lombok.Getter;
import lombok.Setter;
import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;
import net.sourceforge.stripes.action.SimpleMessage;
import net.sourceforge.stripes.validation.SimpleError;

/**
 * Classe base de todas as ActionBeans, que contém o código compartilhado entre elas.
 *
 * @author Davi Bezerra
 */
public abstract class BaseActionBean implements ActionBean {

    /** O contexto gerado pelo Stripes. */
    private @Getter @Setter ActionBeanContext context;

    /**
     * Adiciona uma String com mensagem de erro no contexto do obj ValidationErrors recebido como parametro.
     *
     * @param msg       String com a mensagem de erro
     * @param parameter parametros (opcional)
     */
    protected void addSimpleErrorMessage(String msg, Object... parameter) {
        getContext().getValidationErrors().addGlobalError(
            new SimpleError(msg, parameter));
    }

    /**
     * Adiciona uma mensagem informativa no contexto do Stripes.
     *
     * @param msg
     *          Mensagem.
     * @param parameter
     *          parametros (opcional).
     */
    protected void addSimpleMessage(String msg, Object... parameter) {
        getContext().getMessages().add(new SimpleMessage(msg, parameter));
    }
}
