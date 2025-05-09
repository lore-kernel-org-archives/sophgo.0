Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB3025D533
	for <sophgo@lists.linux.dev>; Fri,  9 May 2025 22:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830553; cv=none; b=L0EBA3OgEf6+oUTTbtfcNMGGL2pIHXh3rl0JCVb7Tuh62lEW3PUzj++xhUvTgrqvelRj/vkiEIU0DiNMtE0ACPtYhrkQ5TLz5ZHE4ivZP9hrZuFBWor3PxfqsSkysip4+vXKeaqxMt3j8t7v5r1LjCs3DRy3VXzn8SRGrwd5C+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830553; c=relaxed/simple;
	bh=UJZQUK8D1H3zEiED8f40de5LqEEQaL3RXIbV8jJICRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0PP/Vv6og7UAzwekCUbQiSZbih/E+6D+W7ZxMPzZXUCQNyoEIuw5gNX80i6B4thKxvAUJZomeMz+iajUgnqQ5BNhTWe4IT326OJZ5DRcZO1aUyKRgGYmiRr5ZOcsWANBNSIHXGjp6/t16+o35KJOmBlKnRkPgt7oaNDC38MlsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0efEnpS; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0efEnpS"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c9376c4bddso299561385a.3
        for <sophgo@lists.linux.dev>; Fri, 09 May 2025 15:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746830549; x=1747435349; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=msHOztbjyq9yqEIUeoH3IVEEQXo53ZrXdjUyNVKV2Yg=;
        b=Q0efEnpSZE2ow9yNOVdSBR3k+H7yDQxD9ihLRmDhcAa3tJrqbNV59nLe/D35Xs4W8v
         OjGgdc8ZrlEoyzFVySBZU4k0KWyNDBuu0Tq9RFS2PrKwny5pi22QCLkFgzg2JZZ4pdP7
         YL/jpbAYt8DEw/931w04ZgMt+Ll8K9GAW2K7JDjrPjGrS7Q1dtaCNYXJDM6BUcTOUwHB
         H5ltsHb6CoKSSc7FncWPiXtW+OIIm+tAERxsKIm6rFPXZ4QYapY+38W2EVM/Jk3upvxm
         Vroi113V1sVE4Nvc/NCvaY0XHScSNY1D+lMYQ8RzzEoZLGmQKXRUlRvOlVk3NVIFrmm/
         sRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746830549; x=1747435349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msHOztbjyq9yqEIUeoH3IVEEQXo53ZrXdjUyNVKV2Yg=;
        b=tNn780uY3y0UlEfMtkgyaVaFFG2Xx/65MwsZnrX7ZeQD1ZTaZrpLPEdBZdTOFkOgKC
         1yflHqXNIMIi3+u1i7I0hmllIjawfGEe54InW7AUjBaNAF2HX5qfC0+hHMvmIPXn77iJ
         ZGGDv5N4LYiQ4q7iCo8SacvN8IBtg7dRDetuL3tKrhfEhPRXt1ULtn2X4V6GwU4RlCXb
         mWPkYKcj2IMNXUEWJd0OsIOOsztnC5zVbTswFcFZ79ScHkCyr6J2nUd2hLVAnvWt5dxY
         whmyJ7oKIZ+6HoPxTsZwp973+4dnxK7ThmlaHxxCGU2y/3Z5/+kaO5iGxPA4hRWCWRL4
         jluw==
X-Forwarded-Encrypted: i=1; AJvYcCWW88PEDdR1DdkQEH7z8zapdoCr5q6yD3utVbmcJGEBsMc67c/cxor1KhT0w9HyMRCV6oGcCTs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxse9Yq2qSm2BYA1Q7enZdzd/Mcv0QPRvzGTIX1vyygigxS8Y3Q
	kzAyz2Mt1Clw1KwdwO+14USB7H/VY+XrzOh6NP6md50AX2iPd8TP
X-Gm-Gg: ASbGncue9kl5aHDVkuH1ltB1t/3xpk3kkk851tXrh1jUvqkYpalE3CylaxJ1WYoCpMV
	k5n+f3Tks9VgFHRbwXub6Qhb+dlxrgB37WFrsP96Ddr4VWZG7JfDkBgIonVjSM3E0GY7m8W6aEz
	shz1UCatZV74gXJNq4tDr+OVF91f/NkYBRslFhcXChWakOm29gMkAduU0UQOHUk4JUyX/lpe7to
	CTWX549SUEmSfG9J07b0p0R4I8spyKaFeeTdDdd6jtGuD0MKeg8ol7QGmPZQQQzn+afAhu/MKSV
	bCgO0Uz+jXWQpfNt/5F+pVa45GA=
X-Google-Smtp-Source: AGHT+IF2nmpQrGYnNJ3kGt9vg2TNZfXedBd1efP8m/k0Dzwcc27Blqyf+tRDQHXu1l4xl93RzqHNeA==
X-Received: by 2002:a05:620a:4549:b0:7ca:d9e8:d722 with SMTP id af79cd13be357-7cd010f7058mr657732585a.17.1746830549496;
        Fri, 09 May 2025 15:42:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f98a89sm196704185a.53.2025.05.09.15.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:42:29 -0700 (PDT)
Date: Sat, 10 May 2025 06:42:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: add ziccrse for sg2042
Message-ID: <yan76lhmlemqxw4ytpinvwuiucgqgmqxrekiepsygjqcmpw3i3@k67zshipj273>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <13d3da8f0979f50e561888164f1fbeba8cd11a3b.1746828006.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13d3da8f0979f50e561888164f1fbeba8cd11a3b.1746828006.git.rabenda.cn@gmail.com>

On Sat, May 10, 2025 at 06:11:23AM +0800, Han Gao wrote:
> sg2042 support Ziccrse ISA extension [1].
> 
> Link: https://lore.kernel.org/all/20241103145153.105097-12-alexghiti@rivosinc.com/ [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 128 ++++++++++----------
>  1 file changed, 64 insertions(+), 64 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> index 927e0260acbd..04a6875574bb 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> @@ -259,7 +259,7 @@ cpu0: cpu@0 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <0>;

I prefer to keep the maximum 74 chars per line. I suggest wrapping
the string. This apply to all the change of this file.

Regards,
Inochi

> @@ -285,7 +285,7 @@ cpu1: cpu@1 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <1>;
> @@ -311,7 +311,7 @@ cpu2: cpu@2 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <2>;
> @@ -337,7 +337,7 @@ cpu3: cpu@3 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <3>;
> @@ -363,7 +363,7 @@ cpu4: cpu@4 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <4>;
> @@ -389,7 +389,7 @@ cpu5: cpu@5 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <5>;
> @@ -415,7 +415,7 @@ cpu6: cpu@6 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <6>;
> @@ -441,7 +441,7 @@ cpu7: cpu@7 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <7>;
> @@ -467,7 +467,7 @@ cpu8: cpu@8 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <8>;
> @@ -493,7 +493,7 @@ cpu9: cpu@9 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <9>;
> @@ -519,7 +519,7 @@ cpu10: cpu@10 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <10>;
> @@ -545,7 +545,7 @@ cpu11: cpu@11 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <11>;
> @@ -571,7 +571,7 @@ cpu12: cpu@12 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <12>;
> @@ -597,7 +597,7 @@ cpu13: cpu@13 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <13>;
> @@ -623,7 +623,7 @@ cpu14: cpu@14 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <14>;
> @@ -649,7 +649,7 @@ cpu15: cpu@15 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <15>;
> @@ -675,7 +675,7 @@ cpu16: cpu@16 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <16>;
> @@ -701,7 +701,7 @@ cpu17: cpu@17 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <17>;
> @@ -727,7 +727,7 @@ cpu18: cpu@18 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <18>;
> @@ -753,7 +753,7 @@ cpu19: cpu@19 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <19>;
> @@ -779,7 +779,7 @@ cpu20: cpu@20 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <20>;
> @@ -805,7 +805,7 @@ cpu21: cpu@21 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <21>;
> @@ -831,7 +831,7 @@ cpu22: cpu@22 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <22>;
> @@ -857,7 +857,7 @@ cpu23: cpu@23 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <23>;
> @@ -883,7 +883,7 @@ cpu24: cpu@24 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <24>;
> @@ -909,7 +909,7 @@ cpu25: cpu@25 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <25>;
> @@ -935,7 +935,7 @@ cpu26: cpu@26 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <26>;
> @@ -961,7 +961,7 @@ cpu27: cpu@27 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <27>;
> @@ -987,7 +987,7 @@ cpu28: cpu@28 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <28>;
> @@ -1013,7 +1013,7 @@ cpu29: cpu@29 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <29>;
> @@ -1039,7 +1039,7 @@ cpu30: cpu@30 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <30>;
> @@ -1065,7 +1065,7 @@ cpu31: cpu@31 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <31>;
> @@ -1091,7 +1091,7 @@ cpu32: cpu@32 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <32>;
> @@ -1117,7 +1117,7 @@ cpu33: cpu@33 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <33>;
> @@ -1143,7 +1143,7 @@ cpu34: cpu@34 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <34>;
> @@ -1169,7 +1169,7 @@ cpu35: cpu@35 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <35>;
> @@ -1195,7 +1195,7 @@ cpu36: cpu@36 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <36>;
> @@ -1221,7 +1221,7 @@ cpu37: cpu@37 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <37>;
> @@ -1247,7 +1247,7 @@ cpu38: cpu@38 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <38>;
> @@ -1273,7 +1273,7 @@ cpu39: cpu@39 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <39>;
> @@ -1299,7 +1299,7 @@ cpu40: cpu@40 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <40>;
> @@ -1325,7 +1325,7 @@ cpu41: cpu@41 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <41>;
> @@ -1351,7 +1351,7 @@ cpu42: cpu@42 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <42>;
> @@ -1377,7 +1377,7 @@ cpu43: cpu@43 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <43>;
> @@ -1403,7 +1403,7 @@ cpu44: cpu@44 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <44>;
> @@ -1429,7 +1429,7 @@ cpu45: cpu@45 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <45>;
> @@ -1455,7 +1455,7 @@ cpu46: cpu@46 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <46>;
> @@ -1481,7 +1481,7 @@ cpu47: cpu@47 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <47>;
> @@ -1507,7 +1507,7 @@ cpu48: cpu@48 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <48>;
> @@ -1533,7 +1533,7 @@ cpu49: cpu@49 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <49>;
> @@ -1559,7 +1559,7 @@ cpu50: cpu@50 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <50>;
> @@ -1585,7 +1585,7 @@ cpu51: cpu@51 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <51>;
> @@ -1611,7 +1611,7 @@ cpu52: cpu@52 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <52>;
> @@ -1637,7 +1637,7 @@ cpu53: cpu@53 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <53>;
> @@ -1663,7 +1663,7 @@ cpu54: cpu@54 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <54>;
> @@ -1689,7 +1689,7 @@ cpu55: cpu@55 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <55>;
> @@ -1715,7 +1715,7 @@ cpu56: cpu@56 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <56>;
> @@ -1741,7 +1741,7 @@ cpu57: cpu@57 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <57>;
> @@ -1767,7 +1767,7 @@ cpu58: cpu@58 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <58>;
> @@ -1793,7 +1793,7 @@ cpu59: cpu@59 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <59>;
> @@ -1819,7 +1819,7 @@ cpu60: cpu@60 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <60>;
> @@ -1845,7 +1845,7 @@ cpu61: cpu@61 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <61>;
> @@ -1871,7 +1871,7 @@ cpu62: cpu@62 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <62>;
> @@ -1897,7 +1897,7 @@ cpu63: cpu@63 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <63>;
> -- 
> 2.47.2
> 
