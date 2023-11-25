package training.mapper;

import org.apache.ibatis.annotations.Param;
import training.model.Pet;

import java.util.List;

public interface PetMapper {
    void insere(Pet pet);

    void atualiza(Pet pet);

    void remove(Pet pet);

    Pet buscaPorId(@Param("idPet") Integer idPet);

    List<Pet> listaPorExemplo(Pet exemplo);

}
