Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C0C40BF5
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 06:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996084; cv=none; b=TjkYNVnxWx3/RNa/0R+GSB6j4V8t10Dr1+jAEUP+rzGTH9U9PoEj9JE9aKms/P+cjQVtApv726/PQtKuZm6340xLAXsxb/mSoG7/SIIgfT6NjmPjy9iZpK/1k4wybSlyaxIH7KImGqDt+f2LOEevCKCdiEAeLkWJj40yM2IcmNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996084; c=relaxed/simple;
	bh=FWsVKMBpJoSvjzMtNQ11+FVVEGiAvbP5ltH1178r0LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyeUdmxX3RgYO1dYXOlyS1pPH9PimwAXtj0y59l5tH5DR4D2LzMClTeMZONR9W+jOlv2Fx7Y6hCmjTE0Qd/6aBSAUWXWWJpsHHIuQaK2JqkpH0EguwqhGLdg6mgTcBFrOHEoIpc9i+3nntR/0lIxykqDQeNIzDrgZzsW7dlF3Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HD3bXBYj; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD3bXBYj"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8fce04655so73708516d6.3
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 23:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996080; x=1746600880; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IHPC6ouTLZh9rZq6+aZMT/nynJpeCvxeKEaQao7uCfI=;
        b=HD3bXBYjyxbYjV4Jw1WhQeKz4qKTNUvm+3ev7Et88i0/WypeysblIvkLo0iA42AygV
         J8DY8uIdt/9SiGx2MmBwUZKl2ZVsk2KcFwXanrLTCj+HyEdHZ+cXBw9f/K2mRLeh4lHm
         Q6oK5QrhKBC0zvbGFECBfTcVFU8dF4yTeQnfXS1OdiOQz8kwarB8l97KcuI0V3gmDxHc
         QXF/xV+rmaCFBwE86w3EXcOSa6U0O6t2jSHo6byX3S+wV4mreSyRe61w7C7ieoyoHIdt
         VH1o8ajYXE2ySNRmagBZgdfi3hiFNKDgDnJw+SUe4jGM6+zckb9p96oV1wP2cnuVC31+
         Rf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996080; x=1746600880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHPC6ouTLZh9rZq6+aZMT/nynJpeCvxeKEaQao7uCfI=;
        b=cnlHf0fWCq3auY04a7F7YMuv9r1/MV7cvRe1cy+Lea1gJO1CosRrPIxqqyz5VephpP
         LtwM4lG3a681eCdjkOwkaohZc0vhrqiE3/0AidvEs0WHTHqPyr1ADdcij44vPTyEtfPU
         ZiG3Qh2bTnoplrAsGPxhBziV04Q0/AM28uE36n+OIjyQqZWE87fEydYB+dMtP6T21PpX
         6MFXZWh5xcb86JURVQegjYb1qttAn1QQA26hqFgTJp9x3qrt7ozPAZl/gVgfwyNyIhYO
         rbrDiLfHr8O8xL3YFWEinUBapJqtv/PuqYNCiNUALEP37BwwGQ0Vtt524L+BcB9jfqlu
         bxUg==
X-Forwarded-Encrypted: i=1; AJvYcCW4tlWIjvi5l6s7KVtzDY9gKjRGanAx0eCu25VPH9YXw9QRG3CFWqqlRCaKp3RIOzzix58eHvE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRojotb1L4SIbmGN6Alxo1u2nRVjcDNFAbTh1rg1h6T4Oy2gDP
	zxAbeAu28prx7quivANYNn3aDY7xJnk9eMyCr9/ZRbdIrrCU7V8U
X-Gm-Gg: ASbGncttuY79BWu3mQ4zJWehl14zVrm90xql++Oxv/GCsLt9oL499PMBVWvM7CM++Yx
	BBLX3LT5uRzwtvz2J5c2Fynh3L6uWs5A1FchsaXZxNBfqc60D4sfkCq7xkk47k1Tzi0TZ5lD48H
	XqgMvBYqVg2aPfz4opYSZB1ugdAuZnkShZGw3DM4CpfRMpX8792afA7TlKfUlIFHSgrYACzqCf4
	SbzKSM5oz9mzG2nftxHhAhtvkiLmRMUq46CZn23NsrguFmNR+7Gi4WnRNbefsK3qgs5VfahMJlE
	n0K7nFP3A2HHPxoz
X-Google-Smtp-Source: AGHT+IFizVCYxmFryP83K8Efv63dHaODZi9WbULtELwp3gzA1WDs1vRsKFV4wOSDStjITe1CP6hCgw==
X-Received: by 2002:a05:6214:1d0b:b0:6e8:fe16:4d45 with SMTP id 6a1803df08f44-6f4fcfcb78fmr31461436d6.41.1745996080261;
        Tue, 29 Apr 2025 23:54:40 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe8358dcsm5091866d6.86.2025.04.29.23.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:54:39 -0700 (PDT)
Date: Wed, 30 Apr 2025 14:54:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Ze Huang <huangze@whut.edu.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yu Yuan <yu.yuan@sjtu.edu.cn>, 
	Ze Huang <huange@whut.edu.cn>
Subject: Re: [PATCH] riscv: dts: sophgo: fix DMA data-width configuration for
 CV18xx
Message-ID: <uo7nea7hxw7qrzw7yhtoulusejbynw6qlotwozpboxtm6vyotv@rdkuc4d776so>
References: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>

On Mon, Apr 28, 2025 at 05:24:36PM +0800, Ze Huang wrote:
> The "snps,data-width" property[1] defines the AXI data width of the DMA
> controller as:
> 
>     width = 8 × (2^n) bits
> 
> (0 = 8 bits, 1 = 16 bits, 2 = 32 bits, ..., 6 = 512 bits)
> where "n" is the value of "snps,data-width".
> 
> For the CV18xx DMA controller, the correct AXI data width is 32 bits,
> corresponding to "snps,data-width = 2".
> 
> Test results on Milkv Duo S can be found here [2].
> 
> Link: https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/dma/snps%2Cdw-axi-dmac.yaml#L74 [1]
> Link: https://gist.github.com/Sutter099/4fa99bb2d89e5af975983124704b3861 [2]
> 
> Co-developed-by: Yu Yuan <yu.yuan@sjtu.edu.cn>
> Signed-off-by: Yu Yuan <yu.yuan@sjtu.edu.cn>
> Signed-off-by: Ze Huang <huange@whut.edu.cn>
> ---
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>

I think there is a wrong sob here, also, please add a fixes tag if
you fix something. I will take care of this when merging.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
