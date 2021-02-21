package pl.gastromanager.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.gastromanager.model.Payments;
import pl.gastromanager.model.Users;
import pl.gastromanager.repository.RoleRepository;
import pl.gastromanager.service.PaymentsService;
import pl.gastromanager.service.UserService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/payments")
public class PaymentsController {
    private final PaymentsService paymentsService;
    private final UserService userService;
    private final RoleRepository roleRepository;

    public PaymentsController(PaymentsService paymentsService, UserService userService, RoleRepository roleRepository) {
        this.paymentsService = paymentsService;
        this.userService = userService;
        this.roleRepository = roleRepository;
    }

    @RequestMapping("/all")
    public String showAllPayments(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Users currentUser = userService.findByUserName(auth.getName());
        Long id = currentUser.getId();
        List<String>roles=paymentsService.findAllRolesByUserId(id);

        if (roles.contains("ROLE_ADMIN" )) {
            List<Payments> paymentsAll = paymentsService.findAllPayments();
            model.addAttribute("payments", paymentsAll);
        } else {
            List<Payments> payments = paymentsService.findPaymentsByUserId(id);
            model.addAttribute("payments", payments);
        }
        return "payments/list";
    }

    @RequestMapping("/{id}")
    public String showPayment(@PathVariable("id") long id, Model model) {
        Optional<Payments> payment = paymentsService.getPayment(id);
        model.addAttribute("payment", payment);
        return "payments/getPayment";
    }

    @RequestMapping("/add")
    public String showFormToAddPayment(Model model) {
        model.addAttribute("payment", new Payments());
        return "payments/add";
    }

    @PostMapping("/add")
    public String saveNewPayment(Payments payments) {
        System.out.println(payments.getDate().toString());
        paymentsService.addPayments(payments);

        return "redirect:/payments/all";
    }

    @RequestMapping("/edit/{id}")
    public String editPaymentForm(@PathVariable("id") Long id, Model model) {
        Payments payment = paymentsService.getPayment(id).get();
        model.addAttribute("payment", payment);
        return "payments/edit";
    }

    @PostMapping("/edit")
    public String editPayment(Payments payments) {
        paymentsService.editPayment(payments);
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+payments);
        return "redirect:/payments/all";
    }

    @RequestMapping("/delete/{id}")
    public String deletePayment(@PathVariable("id") long id) {
        paymentsService.deletePayment(id);
        return "redirect:/payments/all";
    }
}



