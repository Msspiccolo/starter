package training;

import java.io.IOException;
import java.util.EnumSet;

import javax.servlet.DispatcherType;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

import lombok.val;
import lombok.extern.slf4j.Slf4j;
import net.sourceforge.stripes.controller.StripesFilter;

/**
 * Configuração programática do Servlet que substitui o web.xml convencional.
 *
 * @author Davi Bezerra
 */
public @Slf4j class Initializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        servletContext.setInitParameter("javax.servlet.jsp.jstl.fmt.localizationContext", "StripesResources");

        val rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.scan("training");

        servletContext.addListener(new ContextLoaderListener(rootContext));

        val stripesFilter = servletContext.addFilter("StripesFilter", StripesFilter.class);
        stripesFilter.setInitParameter("ActionResolver.Packages", "training.actionbeans");
        stripesFilter.setInitParameter("LocalePicker.Locales", "pt:utf-8");
        stripesFilter.setInitParameter("Extension.Packages","net.sourceforge.stripes.integration.spring");

        stripesFilter.addMappingForUrlPatterns(
            EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD, DispatcherType.INCLUDE, DispatcherType.ERROR),
            false,
            "*.jsp");

        stripesFilter.addMappingForServletNames(
            EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD, DispatcherType.INCLUDE, DispatcherType.ERROR),
            false,
            "StripesDispatcher");

        val stripesDispatcher = servletContext.addServlet("StripesDispatcher", net.sourceforge.stripes.controller.DispatcherServlet.class);
        stripesDispatcher.setLoadOnStartup(1);
        stripesDispatcher.addMapping("*.action");
    }
}
