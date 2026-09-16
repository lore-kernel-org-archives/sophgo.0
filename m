Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C40A36D503
	for <sophgo@lists.linux.dev>; Wed, 16 Sep 2026 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578634; cv=none; b=NmSVb3VmzhWHEg4znrqolcT1OLrixhM10HAl2yObbNYfhviYotnA6rKUocT+/YyT1aK17G1bgoTtvTtalZ6z+IzadYbybBGUA4v9VfkWPcIyXHtYLC4exyRKZ/LfbTaF/BSAPsNrIgCwSaugT/t4VB8+4PaJuM5D7PhXVSwd37Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578634; c=relaxed/simple;
	bh=i8Tw9+Y0LbLQQkfb0VjBjO33Jh4ZfQKD94u7NvLdVx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oevcj/T2+GCqSxKeGnctH99Gpjqh6isDeqKSg5te69V4qd4QWVVHnlSDRx/UmCBc6+Y3qV3DZLu4OUvoEubMSRnr4WE+U/jur3CUixkoZXtUj2j4gUYrHMg5R6zaf2PB3LnguNZXqurMUQJ6DeQWNwFpJOb3OEQYxI7/rabfJaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=m9zrk6rJ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="m9zrk6rJ"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b35601so712953b3a.3
        for <sophgo@lists.linux.dev>; Wed, 16 Sep 2026 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789578627; x=1790183427; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QH7TCKimipR8xV32SdX4PILN4e3j5bJ+o9cYY2F4DU=;
        b=m9zrk6rJH5yLcRdQU98D6d+H9WJFhxYfKueAtVosxxmXtZwcaE13ubqusqtrFf8ImZ
         VmtLojz2XIWEA7KQrNudK6xMbaHDfR16qO/U9OzDOyNLATpS4E9EVykrG/DDvddmfktl
         dfEylo5TP+rwrhD9ofrLdFPQReP+4HehTkF4jo7BvRdE12J8E4su1zEKIBdhcfmzwqc8
         T8NDCIpJGCwHmw40tGXNSx/pFTTZ+TkOixbvE4XXO2zYo1o4w6pYe5+4y68NnevWRe4n
         fwzc5+LJiLzHlSTjM/Fi7PG1SYZjfYUfGha/qhILSthEM5atsGSsAvDwhVovaMJiDDAh
         PHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578627; x=1790183427;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QH7TCKimipR8xV32SdX4PILN4e3j5bJ+o9cYY2F4DU=;
        b=cXN+V2/95UKMNXw9Mu/xhWOKK5d66FI3psXgKVOSJ1XEPamSleLlDf8N/LR+zWb7AJ
         0p6i+B91vamN4HxudXviAcJhAJbjjw4zl1qpyKhVTxnQehvnvcCzpqzk009kK4LBxpRr
         ElH7Z8A3wU+lGRID/I2kS8ANqIpcBo5pSXKHgH4N+VGrTBJsJHt1qJXzO3+23Pj1GcKH
         9MQtk5FddKX/hPEnd1y1UJrBNTUi36UonGdj7QC/3HslHU6LKPS1/pq1wKOwHmOKLoyi
         X/ptU3yF97h5lOF8qYsbv04QuaBEAST0mgiCcsQjEZ/MlQblfqNd++8nM2piPAWUZExj
         sovw==
X-Forwarded-Encrypted: i=1; AKwUvBwCKLnQCXPaH0m/mcUEN83od6qdTudAXT7sMT+TF0R7ziTzk0WDtBWIVDjvGLdC3I5tD+YBj/I=@lists.linux.dev
X-Gm-Message-State: AFuF++m6D59b0r16jufwEqY21nKro4mxmE3cQ6scoAi+etm4pGpcv2fu
	TOO6K5ukCvtUKyYwmtcHGwlpkiJlL5KTQ8qkCvw70o2YA6HUnu8QfCQ22jU8eg1gWnc=
X-Gm-Gg: AYBFou2OZHbYD7Ed4AaPL6YekofAQl5sRIxW7kYzcdhkfqoZyK3eiXYqJVGuBSbRi+8
	0fa9dkDUigt1Jpjs5Jfjh+EnI//VsHUA2vtHlKU/DevOnjMLMNwvZ91BKrFHr2OQUyEimVrSNy0
	qI6mp3IsfNoOVsy2stu0otTPZ74Khb/lDXBYlp7EtcGkEvQKjK2UDqsBCqKF7y8rgZtNoejffLi
	0kCR5tzBC8xJL33EchUhOZwPJv0/M6H7pEFmhoTFYTG3C8VM/mxd8mleTvovVLRuNHrymGal0Ur
	VFCRP4zv2nxP41FAM951fZn7MeXG4og/jJygizLe1L7G6f4g7QPR1XierblL0vBmuhYU7HOZAEU
	aDuF9cD6ox9ajJaO1f3MVFVCuShhqmuogtvl5SisgMhUlhPxSPq3FRcOq4p/aIeCvII3LpjJ9WG
	nL7OfQ73bM3aB6VwKgBBo27Kr3bnfv3RAJAS4t/mMiefqzB5bSmde+ByL5xdHh5H7UAde3Vs2Ih
	r7/4LvuRjjYd3g9OQ02
X-Received: by 2002:a05:6a00:181b:b0:86d:3958:6b13 with SMTP id d2e1a72fcca58-872391ab57emr6854570b3a.19.1789578626409;
        Wed, 16 Sep 2026 10:10:26 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.13.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm1607393b3a.51.2026.09.16.10.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 10:10:25 -0700 (PDT)
Message-ID: <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
Date: Wed, 16 Sep 2026 12:10:23 -0500
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrei,

On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
> The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
> Reserve this region to prevent Linux from using it.

If the FSBL wants to reserve some RAM, it should modify the devicetree at
runtime to add that reservation. Adding the reservation here creates an
unnecessary ABI surface between the FSBL and all consumers of the devicetree.

Regards,
Samuel

> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> index 78a257839f6f..693c9fd7b771 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -22,6 +22,17 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		coprocessor_rtos: region@9fe00000 {
> +			reg = <0x9fe00000 0x200000>;
> +			no-map;
> +		};
> +	};
> +
>  	wifi_pwrseq: wifi-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;
> 
> ---
> base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> change-id: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd
> 
> Best regards,
> --  
> Andrei Lalaev <andrey.lalaev@gmail.com>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

