// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.web;

import fr.imag.professionalinfo.domain.Entreprise;
import fr.imag.professionalinfo.domain.Position_;
import fr.imag.professionalinfo.web.Position_Controller;
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

privileged aspect Position_Controller_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String Position_Controller.create(@Valid Position_ position_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, position_);
            return "position_s/create";
        }
        uiModel.asMap().clear();
        position_.persist();
        return "redirect:/position_s/" + encodeUrlPathSegment(position_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String Position_Controller.createForm(Model uiModel) {
        populateEditForm(uiModel, new Position_());
        return "position_s/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String Position_Controller.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("position_", Position_.findPosition_(id));
        uiModel.addAttribute("itemId", id);
        return "position_s/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String Position_Controller.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("position_s", Position_.findPosition_Entries(firstResult, sizeNo));
            float nrOfPages = (float) Position_.countPosition_s() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("position_s", Position_.findAllPosition_s());
        }
        addDateTimeFormatPatterns(uiModel);
        return "position_s/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String Position_Controller.update(@Valid Position_ position_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, position_);
            return "position_s/update";
        }
        uiModel.asMap().clear();
        position_.merge();
        return "redirect:/position_s/" + encodeUrlPathSegment(position_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String Position_Controller.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Position_.findPosition_(id));
        return "position_s/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String Position_Controller.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Position_ position_ = Position_.findPosition_(id);
        position_.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/position_s";
    }
    
    void Position_Controller.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("position__datefin_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("position__datedebut_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void Position_Controller.populateEditForm(Model uiModel, Position_ position_) {
        uiModel.addAttribute("position_", position_);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("entreprises", Entreprise.findAllEntreprises());
    }
    
    String Position_Controller.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
