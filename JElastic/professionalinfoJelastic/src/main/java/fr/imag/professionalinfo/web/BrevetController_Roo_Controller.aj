// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.web;

import fr.imag.professionalinfo.domain.Brevet;
import fr.imag.professionalinfo.domain.Inventeur;
import fr.imag.professionalinfo.domain.Organisme;
import fr.imag.professionalinfo.web.BrevetController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect BrevetController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String BrevetController.create(@Valid Brevet brevet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, brevet);
            return "brevets/create";
        }
        uiModel.asMap().clear();
        brevet.persist();
        return "redirect:/brevets/" + encodeUrlPathSegment(brevet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String BrevetController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Brevet());
        return "brevets/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String BrevetController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("brevet", Brevet.findBrevet(id));
        uiModel.addAttribute("itemId", id);
        return "brevets/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String BrevetController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("brevets", Brevet.findBrevetEntries(firstResult, sizeNo));
            float nrOfPages = (float) Brevet.countBrevets() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("brevets", Brevet.findAllBrevets());
        }
        addDateTimeFormatPatterns(uiModel);
        return "brevets/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String BrevetController.update(@Valid Brevet brevet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, brevet);
            return "brevets/update";
        }
        uiModel.asMap().clear();
        brevet.merge();
        return "redirect:/brevets/" + encodeUrlPathSegment(brevet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String BrevetController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Brevet.findBrevet(id));
        return "brevets/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String BrevetController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Brevet brevet = Brevet.findBrevet(id);
        brevet.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/brevets";
    }
    
    void BrevetController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("brevet_dateattribution_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void BrevetController.populateEditForm(Model uiModel, Brevet brevet) {
        uiModel.addAttribute("brevet", brevet);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("inventeurs", Inventeur.findAllInventeurs());
        uiModel.addAttribute("organismes", Organisme.findAllOrganismes());
    }
    
    String BrevetController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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