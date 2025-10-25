Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D877C23EA83
	for <sophgo@lists.linux.dev>; Sat, 25 Oct 2025 02:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761359238; cv=none; b=AGHdiKC4wBOVeAhjyPItjcwFqtTlquHh1xaQo4WW/UcWevyYv7xgB8gC/vGRQeIM/YcZsRIpjOcFpm5xUTrgZzvkZeNJdZ3J1fKOclKFV/durBxJtQE6nHK5tBS4AyMvk9gNG+CKrg1bgGeYePX9mQtLU1UzgJOKAWM8k5lBbYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761359238; c=relaxed/simple;
	bh=x8OlYWFi6qnMbSDUo1cgT5csPWwOhJOPBrlPWQui8DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1Swn31c92AWvCbPHf3UdDkh5piJtEEizoA4eNIUXcLY4skwA1n1Q9eS3X05DG53vuEcwpxqXFoYASQWaAVNIIFuWSRgqhuSDPUmh1K8FCWJ2bAH2xD4IA1SHatankfUHj67l4Nr+GiSmDoDgzGhnZMuvg9QnjBM0DMzfBl0pLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJRwVq3m; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJRwVq3m"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2907948c1d2so28647655ad.3
        for <sophgo@lists.linux.dev>; Fri, 24 Oct 2025 19:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761359236; x=1761964036; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m5g8OWVuVjsbahwY/Qa7JcyvpPlQfkEr7235nxaCt5s=;
        b=iJRwVq3mF4kCXdc4s2I6gLPzv4tSUKfy2Jy+S63tYhfk2nEVnO6qB4y5wrR0yFPJu8
         uiLKOkRd3J1EKFxeKgNahLNDXLUXIfV6Jl1QpP9fi+iZNcvhVt0uLiFgmmkm6AYj4z25
         n9aHiNvmXKvCCBKaBhCYdRQJ/zeNwKvacHXE7Je85rdDFsc1Pneoqle6zKJIh/RZSi7i
         VJYpBtHswIQpjRN1i6DCE/aieErBwgWL4x+0wU7bDge3dh4+rBoCnxhSawDPBz6L0OCi
         ett/wtPnO7qY6ahHsaI2cmkrsvc7rnjiKOhTA5kEj05JemS8eKCTxvJY6e43uIjRAJKf
         gOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761359236; x=1761964036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5g8OWVuVjsbahwY/Qa7JcyvpPlQfkEr7235nxaCt5s=;
        b=rrcmprRor9hP8SAc/bivx5Nf878/eDcLPj4oYiR8extV29Gx62Zx8U4b+f/gF+Jo/c
         gL2eVXGG8AWxlNLVRpfmYvAU34bL43xJk1i//s9h/OkUKxn6loFBztR2fNAQ/XkObPNE
         Q8o5vcj7CsRiAnnAIp7R+y33dn+L6hzl75El015MNeYxZqSb0WDUL3LpNwzITkhlsqza
         CsaxpSnBS7WeFiDt8mqSvNvSfSrS4Adme+/jutvsQrlWn+vSIEjBTjCigXuAWsKvDVtz
         b0N3xMJs/O7FfPJpgn3963ts074zypw3ZowB8JGJhqp59DB382Cwb3VpVoHNgJsAISKZ
         CP0w==
X-Forwarded-Encrypted: i=1; AJvYcCU63u4cHkjLGbcCbu9OnVcID3Hb1+EdYsPuAGLb6WtRtW2sszPWVq/p+sXHDW3awbSM7+5wSWY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEM2ps4i04gZAREXgOSJ5a67S1YQENek9luLJxvB55hrVZRKbJ
	CTRrnjvHloM+ThYc/3/cWDRmSrdjJZlvSxOwF5AE1ag9uArs5HaZuKE4
X-Gm-Gg: ASbGncuNWld8hSL4BCSZlU8AX2dgOVWfXW1vOUL1d1BUI+6EK4n/sSsx8omZPxVc2We
	1d4XbjQCeGbSD2gwafQtqQ/bZB63cj+MJb7ELp7v0K0aRPiGeUFWpjfE7AiZPx2goGF4OJHJJmD
	gFW7niYBvxfEx2oNnU5QWwR++l5zgrpp2FVmN+rIVPFSkuXViY5ZyTMTHbiWOmScGq9mocnLYX+
	upTVL0zSmtBLZdE7Q7y7A9t3G3nlosSQUlut2f9YRDY1yS9gsZnmH/EEV4SBIslm2HIUcO4QDWx
	o86kpSC0jUQh2O8MeiK3wYdPGYdwIlZeOZyTsUfctGvEXMWdXBPNJcTP9wZnprdhk9yJ9EZ4dxs
	otDmSp64H9D4Hgg2pzFCuzHuCLon1ZaPXKLHrTYPgbWw0yalEeipuzVa0pS8bGWDK6Njj1lYeqJ
	ezzOGsEtuhgp+eK5u6Glrnrw==
X-Google-Smtp-Source: AGHT+IFfj8dcaPyoJUnBwrQrbEjc0tKnxl0fbsVgVFk4QvGgEAOydtQrbEdriDic6wnAsYVeECy3eg==
X-Received: by 2002:a17:903:1c2:b0:270:ced4:911a with SMTP id d9443c01a7336-2946de4071amr99308125ad.9.1761359236031;
        Fri, 24 Oct 2025 19:27:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d23334sm6685145ad.52.2025.10.24.19.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 19:27:15 -0700 (PDT)
Date: Sat, 25 Oct 2025 10:27:13 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <oymxspgopaqja63nipufgzn6kpobkdopemfaw3azhom3ikvk5f@e7cg4lq64j2o>
References: <20251024030528.25511-1-looong.bin@gmail.com>
 <20251024030528.25511-2-looong.bin@gmail.com>
 <20251024-hangout-designing-33e96c0d35fc@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-hangout-designing-33e96c0d35fc@spud>

On Fri, Oct 24, 2025 at 05:46:03PM +0100, Conor Dooley wrote:

> > ...
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: sophgo,cv1800b-top-syscon
> > +          - const: syscon
> > +          - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges: true
> 
> Do you actually use ranges?
> 
> > +patternProperties:
> > +  "dma-router@[0-9a-f]+$":
> 
> Do these actually appear at variable addresses, or is it always 48 for
> the phy and 53 for the dma router?
> 
> > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> > +    unevaluatedProperties: false
> > +
> > +  "phy@[0-9a-f]+$":
> > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/sophgo,cv1800.h>
> > +
> > +    syscon@3000000 {
> > +      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
> > +      reg = <0x03000000 0x1000>;
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +
> > +      usbphy: phy@48 {
> 
> Drop the labels off of these two, since they're unused in the example.
> 

Hi,

Thanks for the review.

There are a couple of different opinions here.
Could you please help confirm which approach is preferred here?

This is Rob's reply:
https://lore.kernel.org/all/20251015134144.GA3265377-robh@kernel.org/
