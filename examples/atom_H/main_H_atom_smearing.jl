function main()
    # Atoms
    atoms = Atoms( xyz_string=
        """
        1

        H  0.0  0.0  0.0
        """, LatVecs = gen_lattice_sc(16.0))

    # Initialize Hamiltonian
    pspfiles = ["../pseudopotentials/pbe_gth/H-q1.gth"]
    ecutwfc_Ry = 30.0
    Ham = Hamiltonian(
        atoms, pspfiles, ecutwfc_Ry*0.5, xcfunc="PBE",
        Nspin=2, extra_states=4
    )
    println(Ham)

    KS_solve_SCF!(
        Ham, mix_method="simple", use_smearing=true, kT=0.01,
        update_psi="LOBPCG", betamix=0.1
    )

end
