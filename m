Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCA82DCC1F
	for <sophgo@lists.linux.dev>; Sat, 22 Aug 2026 02:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787364819; cv=none; b=l9NvnBVcbMlhl+qHGyk7NKjNMbptVXMtRyw3Pltc/Ni4v4x6QaM9bLivVfKC1voCTvXZQ4IRjxMpmNiELwtHdTPIaMzrUZ7tdcrdd+lChh3PTQffMFyUDAPBW1QWFggMXBVj05g1tSGK2XzD/hZDaP0VgP5H/GFH/xCIPLw3yxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787364819; c=relaxed/simple;
	bh=N3/pYQ/HqTfCacdx7qd2fQ6r0Lsg3Bu7F8Hanritaow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FToE3wQYCbrJFMkngCX2VA9rrg+vmaLUvilgzHoPY57ETFUYTX/AQ5fXMnztzT6cjo6o2SeG8SV35XQ9mbiAFTbQLna/DeEL8ygLOEwaI0cSxt9bi4YyB2WrpinogCsS2qDabkbwi2Fe6Mj8qlmcRVgpwli33ZtAtvpwQYyKnSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFYJevWw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFYJevWw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e88b60121so1217496a91.3
        for <sophgo@lists.linux.dev>; Fri, 21 Aug 2026 19:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787364817; x=1787969617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+kJNsMh7lbuSLTH19NsCfuQgNIbC7xznYYNfdfSxlo=;
        b=PFYJevWw6+aljOyU2YJMOEbMcOR5vXgG/K2Gxm90EMSg6/apuIrKPpST946SoUIRXu
         XNVlqS6qMRoIN7X0g8K2VY2rEO5urb/XLzTSA/SPQ5+HuIzkiefEOFhblK2H19pgbGfS
         ups/OxM8zn47ObOt4hWAVCuP7+CGXyX1J01GZ0ktPUrTAtJPZ4Bdg2aEFG5gW3NeJiQD
         aY7wYxah0yUpt8mEIPkEOmNPY4EQ2L0EdpcxRBmKC8WuvOQtEtnDpIng/fb4JQtzv4gV
         MDYlX4xoushArtxJGws8WkPorP9gtTO7CE3K/MBwLvg5IrJ8DDK3rFGr7SCnxyIwXXeT
         udHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787364817; x=1787969617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+kJNsMh7lbuSLTH19NsCfuQgNIbC7xznYYNfdfSxlo=;
        b=eKgewkzvlBbfhNAILRo8FRbhEQxemx+m2DI3yo5iebUS88jwEW7dJTWnQNXu0oxOOw
         jW8m8PBePMotn/+9WL414GdQIxA6uODktcGySwkBx7Qr2FvUJKwitVNY9nhNnriTgbo4
         BCvVRyCS2F9FsOwfhZo6TExS+xNudoz69WVFIqkGYsINlqrjywT2alcoPGdb6otyU6U3
         WLfC0a7ciAvABsk5DXTLNha8twixQyhefxmVpHLEjaM/prtCiOkBazgHMFF1th4/5oyf
         byTgPQOEFU3RvB3GWoEKhKfTL3Ap6QLtfw25S0fyPVTQag5+WYqNbERngSLIMLOlFb9b
         fnDA==
X-Forwarded-Encrypted: i=1; AHgh+RpWhZllhSCkAu1Uu+r2lJX++vfWph3n0XH+GMsu7IrYC2TItb3NdE+CxB+0fwEXXjaa6kC5Y8E=@lists.linux.dev
X-Gm-Message-State: AFuF++kEQBzMg3BINH0UD2rmh1BasAYx9wpWaDeoxlaBNfSZ7Nb5RRUF
	OBBKJuofp3r39ezQRGJaY3Erx2/lKgoqsGrVBdIXTknTP6URGJIYBCdI
X-Gm-Gg: AR+sD12ndyLZv9JX+/vNgTbRcZ2MulZMm1jD7qiFAHQXT7fqsBfV8FTOVIAixUFxR86
	nhpEQSuPPMndX0VYlyj+Eh4m70ph3RH9C9YAS7L0hWuu1Aufc5xr4PDQ4zFT7shX0vgyHzVdnqH
	HosUittnW1qJwCKX/rE9+F9Y1D/qoLjiginMQs8TYR+ARo/ngaKePSFhfDYHnGwGYuL2KuYZuP8
	AHGVXlm2TtUxyOVDhKn8XSii63q8t0+hexQaNlly7touYFTGuaRFF+YvX57gg2Rr4xMvTKkHP5u
	/h3oyKiCCwbmC+XMsKnZPHOwiJDwtcV6JMAV56CEB7RqLh//qMMrYHxNeqElWHW9jn2/tPy4OaY
	Jnw8QZai1+Qh3LFJynYyNxr+aLGEbq4XQSjztoHJl2PdgJyb28d24mhNqmG/+PKcH7dfuX7+ThS
	ALz8jpE6kAhf9t8AypvAl1IrgieqYcp3LtAHV4+tczN3ZOu+4e/ZcSW8cV5i4=
X-Received: by 2002:a17:90b:4a82:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-395dee5610fmr4115491a91.2.1787364817123;
        Fri, 21 Aug 2026 19:13:37 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c91348e2sm1571108a91.2.2026.08.21.19.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:13:36 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:13:34 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, chen.wang@linux.dev, 
	inochiama@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Enable ethernet for Milk-V Duo
 256M
Message-ID: <aokFbP7wArV58T9E@inochi.infowork>
References: <20260803163323.74414-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803163323.74414-1-chenyou910331@gmail.com>

On Tue, Aug 04, 2026 at 12:33:18AM +0800, Chen-Yu Yeh wrote:
> The SG2002 has an internal ethernet PHY, but on the Milk-V Duo 256M the
> ethernet signals are only routed to the RJ45 connector of the optional
> IO board.
> 
> Enable the GMAC and the MDIO multiplexer so that the interface is usable
> when such a board is attached.
> 
> Tested on actual Milk-V Duo 256M hardware: the GMAC probes, the MDIO
> multiplexer selects the internal bus and the internal EPHY is detected
> at address 1:
> 
>   eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]
> 

> Link-up was not verified for lack of the IO board.
> 

This is not acceptable, I agree with something like DT overlay for
support external IO board to enable this. But you should not enable
this by default. As other may want to use this as GPIO.

Regards,
Inochi

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> index a2797c0bd767..1462a96a1c12 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> @@ -49,6 +49,14 @@ coprocessor_rtos: region@8fe00000 {
>  	};
>  };
>  
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +};
> +
>  &osc {
>  	clock-frequency = <25000000>;
>  };
> 
> base-commit: 11881041b745b444e4f6c87a2748f1951cf02742
> -- 
> 2.43.0
> 
