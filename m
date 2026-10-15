Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E5E446066
	for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055055; cv=none; b=D+Em/PEIJWk35jKM8umAe4AmhCBrvtbNVSrq2nkcuSe7pRAi8bKPEGQJkW2GeDAILZIpHeMjT2YYfHpshyXdafzZsQGITfauTaa9WE3Uq1fSJS9vA7641pU/W4ymYbgQ+j/lZ3cmXh0iuAL6CMWwbu17Cy9TX1EuWfvEuoIYPM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055055; c=relaxed/simple;
	bh=xoSMGcPrzf+w4ikyCB84AbmV6Jpjst1FcJWplTx8esM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrJtgjLlLL/9LJWZrokny9P+5ynX7wqkbtKWZg5EcYhrCrcphRNokOzu/Y1C3WBCEAyo26H5YjtwxC2FM5e1cM6qlGQOWNmQaHmdCTUf/sg4R1f1+ldh3yhzlEqzN2/mpFrYyo3Ko3xZe+nwn+f31ZhTKoiKEUs/zUOQum/3sOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYGggDlN; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYGggDlN"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso3901497a91.3
        for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 02:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055054; x=1792659854; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAp8nRUf9PkjRjYtrHFE+R8uyBzEHqKOUymE8wD/INs=;
        b=FYGggDlNHpZf+5EcGQ7+POUOrF1nghjmmDpWpWzjCu9RVZ0X8jvTtHsDkJn/aZ1XEe
         9bDquCW65hlvbFvWOmI+JuMIg6b3vvUPlXHzfnuXywR/bpXtCTyl7EnUjnziuFFgptbw
         2uuBbUPwbIMPoVC187CSrbX52/3/2gsFzqfei3nv6YuHuOY94+pofUwRTMVDC7vDAbrs
         oLFZJb4KZFLAGOQ+ZO6fnDSMPy12ZXykAANwEslbeJfny3IR0V5gR5qpV0UTlflNRpko
         RvdLttsS8ALaZNQKkOp6zbCGJuV01aSMQehCU4ZoRjyAyBPNBgNIhdM1u4IqtU6d/v6e
         XXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055054; x=1792659854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAp8nRUf9PkjRjYtrHFE+R8uyBzEHqKOUymE8wD/INs=;
        b=Rsqd+VJXHTsZZa7EC17X5/89mHgM7xKpj1Zeh3CET+QYtGJW2PyImNYeI1ril5fUVe
         gCmmEAOcd0n0WWjZ6Vbt67IC3wjWOqBD71TyW1lrJlZrcEH3TTfQjyZgFmXKRJit36Tg
         rl6xRn/JZkQaOTnSKtd3NG+JNRvLxC6Y3zFbY3RtOs1u0zhW5TryHg5kJuUWFKcCjT1W
         ruG8B7Lsp4MoPrls2OsOxAwPPba58zjTSzYUpw9hd+IuZB9cIhvfBP1s0bBEMHphwFTn
         fcwbkAG44c4Noo0DyZ92bp29AdK8w6Ddr0Rub/23S+MO7bD9M/hG9onFgLEhnh7Q6frC
         JZZg==
X-Forwarded-Encrypted: i=1; AKwUvByGvQZDGu2hVPUfezlN0smlmf0qPRSPvbWZxGK9HKQJEptdz4h0pUHpo7RmKLThwVeWR+OLZww=@lists.linux.dev
X-Gm-Message-State: AFq9FYKi9B08TWY2wokVLtrOfzn87XLp+XwEgt4bMOMWJNl5ML6ymJSE
	to2DfvabyhlQolcOd3idmWiBxbIqy/SxWvt9KHf0FNTPiy95gBJy4Jpi
X-Gm-Gg: AYBFou1rJskBPd3nw6I31FBivZQPj4GxO8X0Bgf/fmN9+zRKiYHWdIvdqWl7YgaCbV9
	aCG+XbJCooQREkwxC/O7H08lQC0UvNWTbDV/T/7Ct/tzJqElCK3JaV/yNT2oAzlnVbfICLLDSUu
	crG/P+WcRPI9hV16Vjc7R97BYlIQTVExCoB0olopP36XQhytKe/PQkZm6Hpi+QO6l7Cu236l7tW
	JfKJFt9SCozeDnbygqk55z/0HDjf/2Uwdnb4Vd2qJsJ76X0ISHMccHg4l7BLCbRLqW5zdc2F8+L
	CDkJHtNMGk5VVQXH1sjFsRQfrLF6l5gFZMD/xxdNnSJi3K1Ky9Qu0Ei0XpvoSl4QLs0EtPNs+/z
	3MI7xjJiFSpLN5zMLKgCP7jQLI9anS4CxH7lH8scpPPOfOYE7XSHIRB5GZtVOfzfMCZXCjnLpn9
	Sx+U92Ch0F3XnGRdkoq7EIF9UzctKhKbKAMwgc1qFjHDnKG1eUPanWgBL870SKGnDmq28D
X-Received: by 2002:a17:90a:e7d2:b0:3ac:a521:959 with SMTP id 98e67ed59e1d1-3aca52109eemr559134a91.29.1792055053807;
        Thu, 15 Oct 2026 02:04:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm3869119a91.9.2026.10.15.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:04:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:03:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Message-ID: <atCWzDzmknrsMNNQ@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-4-inochiama@gmail.com>
 <20261014-romantic-pretty-petrel-36c7ec@quoll>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-romantic-pretty-petrel-36c7ec@quoll>

On Wed, Oct 14, 2026 at 01:43:50PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 03:45:15PM +0800, Inochi Amaoto wrote:
> > Add eFUSE controller node for SG2044.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
> >  arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
> >  drivers/nvmem/sophgo-efuse.c                         |  1 +
> 
> Review code before sending.
> 
> Best regards,
> Krzysztof
> 

Yeah, I forgot this, I merge it in the wrong patch. Thanks.

Regards,
Inochi
