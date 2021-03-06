// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.web;

import fr.imag.professionalinfo.domain.Personne;
import fr.imag.professionalinfo.domain.Recommandation;
import fr.imag.professionalinfo.web.RecommandationController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect RecommandationController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String RecommandationController.create(@Valid Recommandation recommandation, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, recommandation);
            return "recommandations/create";
        }
        uiModel.asMap().clear();
        recommandation.persist();
        return "redirect:/recommandations/" + encodeUrlPathSegment(recommandation.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String RecommandationController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Recommandation());
        return "recommandations/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String RecommandationController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("recommandation", Recommandation.findRecommandation(id));
        uiModel.addAttribute("itemId", id);
        return "recommandations/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String RecommandationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("recommandations", Recommandation.findRecommandationEntries(firstResult, sizeNo));
            float nrOfPages = (float) Recommandation.countRecommandations() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("recommandations", Recommandation.findAllRecommandations());
        }
        return "recommandations/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String RecommandationController.update(@Valid Recommandation recommandation, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, recommandation);
            return "recommandations/update";
        }
        uiModel.asMap().clear();
        recommandation.merge();
        return "redirect:/recommandations/" + encodeUrlPathSegment(recommandation.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String RecommandationController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Recommandation.findRecommandation(id));
        return "recommandations/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String RecommandationController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Recommandation recommandation = Recommandation.findRecommandation(id);
        recommandation.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/recommandations";
    }
    
    void RecommandationController.populateEditForm(Model uiModel, Recommandation recommandation) {
        uiModel.addAttribute("recommandation", recommandation);
        uiModel.addAttribute("personnes", Personne.findAllPersonnes());
    }
    
    String RecommandationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
