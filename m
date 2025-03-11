Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998071EBA0C
	for <sophgo@lists.linux.dev>; Tue, 11 Mar 2025 23:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741735901; cv=none; b=bvPgf0/SIJS3aXClKmhgkzH9xDbZhJlvESG1JwU08/3WZOl6cyqp6c9swu0Ni5tbqzs9EXR/2J9rPr6T7RBl+CF9qbBfVZtooIOQ53zxT9GehMUFF5JQgRxIa4wuLjj+Jv76uPbsm+tRFzwE07j270Tp421qUbXFYF4C3+R2onY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741735901; c=relaxed/simple;
	bh=VBwwG7l9rCWl77EdQeNbuIKmifjvy46Iw3hIDBS6RME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSeaTWZE8DPlbVWiWkBxPb25rubQFaC6CwvGbA00dGW0RRLKyF+OF2znPbp76OUvfMofSMfjotmBP+T0K471WRi68UjZMtHb9g6onNu7SfCzyfDn6QGrmFU7pxNVjv2zGvLSRhIBr+6z392Z7idCuSLNifqdOEk92g/QP4SBEhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/O22z/G; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/O22z/G"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c54f67db99so29535785a.1
        for <sophgo@lists.linux.dev>; Tue, 11 Mar 2025 16:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741735898; x=1742340698; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=csNibhOv6YnsrzbmKIDpYFSAlfzjMkpooBOgsitHNaU=;
        b=e/O22z/G1+ldomkNgcBHbi936zDeN6L8G88Hs4jcplUt8uXWTdx5DXgsjnmR0drEh0
         Y9vfto0agrotWU4J1Gd/xVq+0QzAa6pf+EfeYmRsTqSMU+l4/0wbv5KMKBCu2ARX8IyP
         H2QawnbhWTMkEgCO/OMCxvFiR8TxoD8gosmDXVZvMIaHjpwmdpkCNmufksEGy1fjhsw1
         BwFq3NSIKwA6SLy9InkJfToJgTNp5IU3l8cdmFBJ50nwpMuRNZZNLnk3dWAu0YgKFYVd
         HJsMDgeUXCZB8yD92YxfATT+NXadzHpgk+xtK5tTJm8N8+Z0HoLnuRQ/WPFIdAb9AwEO
         weCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741735898; x=1742340698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csNibhOv6YnsrzbmKIDpYFSAlfzjMkpooBOgsitHNaU=;
        b=v8A34DFoxv03b/jgUgBPJitb1dUpFSyQzij+Ga22ONijz7XjobvPbx13vxp02lsgJ2
         mJ7hiSVlNMHP8/hwPxk8TRggqACb2iokgBed082ogWo/Ge2x4M4+Y/0xzncfWc/Iubhr
         TPBvECO+CnEOcZG85+fRzZ73uJcqMRl1hV1N0Pwf3G8YNa937fDI8+wMN7NrU5LGfdt8
         2hrryt5RzRPf03iVlBRr33jN/579Sn0sDNUeuNRMsrb45WSqNjC+0h/gRp7ORI7kDk3I
         QT7Vlgx7CQmldvfjCG6RUeQTONWok/ghpcAaEaokWaAKzQHhrTbJfJlaGaERldjnLWNv
         wiHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxAdssGCwKaLf6gULlRq0x+2qWx0vYPdCEqJb6Gm2OlBz8JbxGLKe3n9RMfG2qFQttM50igHE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOdY36xZffcMbnC7R4qB/+q7vtjbDGP6J4uJLd2irtgSKOga9m
	0RnKummJL59XmY7e3TDYSgV4kCrbYPjqMlb7F14y6RIOuLPHKRwK
X-Gm-Gg: ASbGncuAUU4DzqJngIedbBZu2ckmUw64LoAVzWRoaoiq22uhJ8OPjICQZUgWwh/PeOs
	9otPN7HufZn9IZ9BOd/JF6AW5nSIhJVh6LIC0yJaw397xRNNgoaoXO8khsqLoTQ7/L2NfLp/JZg
	2kZWmAniQ/Ry7Yv3/leJMgu1qT2lFJ+kOO5cJvJmtYNOwo7/HN8aiCQ4rjR0kozy8jxUawttKkj
	9r87xVyTRNKW1PlpMFi2F8JQvWUCNcolmJvBj2cYvsLT57hhBZRhA8VyMfR5UFDV5aAns8e0tg6
	3f7AgjtT/iwLEOl2It+A2WxSFu7g31c=
X-Google-Smtp-Source: AGHT+IHq9hqC1JJsQsEh0Cz9ZylVSH0tGSrNyvWOdRkyjR2J/hgMZweHvicPAvizQ4S8l8+AJa2jhA==
X-Received: by 2002:a05:620a:27d3:b0:7c0:b3b4:9e73 with SMTP id af79cd13be357-7c55eeff050mr593292585a.20.1741735898337;
        Tue, 11 Mar 2025 16:31:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8f715b4fcsm78391226d6.78.2025.03.11.16.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 16:31:37 -0700 (PDT)
Date: Wed, 12 Mar 2025 07:31:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: sophgo: add clock controller
 for SG2044
Message-ID: <epnv7fp3s3osyxbqa6tpgbuxdcowahda6wwvflnip65tjysjig@3at3yqp2o3vp>
References: <20250226232320.93791-1-inochiama@gmail.com>
 <20250226232320.93791-2-inochiama@gmail.com>
 <2c00c1fba1cd8115205efe265b7f1926.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c00c1fba1cd8115205efe265b7f1926.sboyd@kernel.org>

On Tue, Mar 11, 2025 at 12:26:21PM -0700, Stephen Boyd wrote:
> Quoting Inochi Amaoto (2025-02-26 15:23:18)
> > diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
> > new file mode 100644
> > index 000000000000..d55c5d32e206
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/sophgo,sg2044-clk.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo SG2044 Clock Controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> 
> No description?
> 

I am not sure the things to be described. Maybe just tell the
clock required and providing?

> > +
> > +properties:
> > +  compatible:
> > +    const: sophgo,sg2044-clk
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - '#clock-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    clock-controller@50002000 {
> > +      compatible = "sophgo,sg2044-clk";
> > +      reg = <0x50002000 0x1000>;
> > +      #clock-cells = <1>;
> > +      clocks = <&osc>;
> 
> I think you want the syscon phandle here as another property. Doing that
> will cause the DT parsing logic to wait for the syscon to be probed
> before trying to probe this driver. It's also useful so we can see if
> the clock controller is overlapping withe whatever the syscon node is,

It sounds like a good idea. At now, it does not seem like a good idea
to hidden the device dependency detail. I will add a syscon property
like "sophgo,pll-syscon" to identify its pll needs a syscon handle.

> or if that syscon node should just have the #clock-cells property as
> part of the node instead.

This is not match the hardware I think. The pll area is on the middle
of the syscon and is hard to be separated as a subdevice of the syscon
or just add  "#clock-cells" to the syscon device. It is better to handle
them in one device/driver. So let the clock device reference it.

Regards,
Inochi

