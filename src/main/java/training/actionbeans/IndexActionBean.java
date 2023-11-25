
package training.actionbeans;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;
import net.sourceforge.stripes.integration.spring.SpringBean;
import training.mapper.ContatoMapper;

/**
 * Página principal do sistema.
 *
 * @author Davi Bezerra
 */
@UrlBinding("/index.action")
public class IndexActionBean extends BaseActionBean {

    /** View de início do sistema. */
    private final static String VIEW_INDEX = "/WEB-INF/jsp/index.jsp";
    private final static String ERROR_JSP = "/WEB-INF/jsp/error.jsp";

    @SpringBean
    private ContatoMapper contatoMapper;

    @DefaultHandler
    public Resolution index() {
        if (contatoMapper == null) {
            addSimpleErrorMessage("Teste de sanidade do projeto: contatoMapper nao foi injetado na action");
            return new ForwardResolution(ERROR_JSP);
        }

        return new ForwardResolution(VIEW_INDEX);
    }

}
