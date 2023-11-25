package training.model;

import lombok.Data;
import lombok.ToString;

import java.time.LocalDate;

@Data
@ToString

public class Pet {
    private Integer idPet;
    private String nomePet;
    private String racaPet;
    private LocalDate dataNascimento;
}
