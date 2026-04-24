{pkgs, ...}: {
    services.ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
environmentVariables = {
        CUDA_VISIBLE_DEVICES = "0";
        LD_LIBRARY_PATH = "/run/opengl-driver/lib";
    };
    };
    services.open-webui.enable = true;

    environment.systemPackages = with pkgs; [
        cudaPackages.cuda_nvcc
        cudaPackages.cudatoolkit
    ];
}
