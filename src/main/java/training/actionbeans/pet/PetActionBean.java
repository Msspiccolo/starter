package training.actionbeans.pet;

import lombok.Getter;
import lombok.Setter;
import lombok.val;
import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.integration.spring.SpringBean;
import net.sourceforge.stripes.validation.DateTypeConverter;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidateNestedProperties;
import training.actionbeans.BaseActionBean;
import training.mapper.PetMapper;
import training.model.Pet;

import java.util.ArrayList;
import java.util.List;

@UrlBinding("/cadastro-pet.action")
public class PetActionBean extends BaseActionBean {

    @Getter
    final List<String> raca = inicializaRacas(); // Sera acessado pelo formPet.jsp


    @Getter
    List<Pet> pets; // Será acessado pelo listaPet.jsp

    @SpringBean
    PetMapper petMapper; // vai salvar o contato no BD

    @Getter
    @Setter
    @ValidateNestedProperties({
        @Validate(field = "nomePet", required = true, on = "salvar", maxlength = 100),
        @Validate(field = "racaPet", required = true, on = "salvar", maxlength = 30),
        @Validate(field = "dataNascimento", required = true, on = "salvar", converter = DateTypeConverter.class)

    })
    Pet pet; // vai receber dados dos form

    @Getter
    @Setter
    Pet filtro; // filtros da tela de listagem

    @DefaultHandler
    public Resolution exibeLista() {
        pets = petMapper.listaPorExemplo(filtro);
        return new ForwardResolution("/WEB-INF/jsp/pet/listaPet.jsp");
    }

    public Resolution preparaInserir() {
        return new ForwardResolution("/WEB-INF/jsp/pet/formPet.jsp");
    }

    public Resolution preparaEditar() {
        pet = petMapper.buscaPorId(pet.getIdPet());
        return new ForwardResolution("/WEB-INF/jsp/pet/formPet.jsp");
    }

    public Resolution salvar() {
        if (pet.getIdPet() == null) {

            // Se nao tiver um ID -> insere
            petMapper.insere(pet);

            addSimpleMessage("Cadastro Pet criado com sucesso!");

        } else {

            // Se tiver um ID -> atualiza
            petMapper.atualiza(pet);

            addSimpleMessage("Cadastro pet atualizado com sucesso!");
        }

        return new RedirectResolution(PetActionBean.class); // Volta para o DefaultHandler da propria classe
    }

    public Resolution excluir() {

        petMapper.remove(pet);

        addSimpleMessage("Cadastro pet removido com sucesso!");

        return new RedirectResolution(PetActionBean.class);
    }



    private List<String> inicializaRacas() {
        val racas = new ArrayList<String>();
        racas.add("Shitzu");
        racas.add("Pitbull");
        racas.add("Viralata");
        racas.add("Chow Chow");
        racas.add("Labrador");
        racas.add("Golden Retriever");
        racas.add("Persa");
        racas.add("Siamês");
        racas.add("Sphynx");
        racas.add("Ashera");
        racas.add("Angorá");
        racas.add("Ragdoll");
        racas.add("Outras");

        return racas;
    }

}
