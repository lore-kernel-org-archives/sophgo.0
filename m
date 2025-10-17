Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96772DA758
	for <sophgo@lists.linux.dev>; Fri, 17 Oct 2025 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760693706; cv=none; b=uRVKw8JSCUvHpE1itM6ReyuOjD9iFHeoh6tawIVGSKWKDspt6XeJOkoBeJjUf5Xg/ZWjrwPCVnhVwqKw9qzJcRypqnNmvduTZ45SAo4Ef+QDt2Rd7mjNnUh2VTByOLnuIh7i51ZIjcFZzg15wV5FCzGv+KhoYNy4G4UmfwPiDeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760693706; c=relaxed/simple;
	bh=xlVdMJZGBR8dYzgKO/sqP1AR71zVHST1qP49gR6hPGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6HzAbVhmXTBvhqFEpJpn+VGUlMHl0i5hOgcNen1P6CfK6JfsVkIUUmmJF8623gu9U9lDJ14ymR1Qcfh+EyUuLhJ9UU2Wg4Fo87J5XbBlzHH2CgzoIOygu15LQUyvgljTCp6QHWy+SBL2UiibQ8M9xbxnct1mDRist6/aGZkfc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Frp48vrT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Frp48vrT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29091d29fc8so18344675ad.0
        for <sophgo@lists.linux.dev>; Fri, 17 Oct 2025 02:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760693704; x=1761298504; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6sefhtiMhuuPq8nFOLwvYqf8fe7o6Hmrgpdt61rNn/I=;
        b=Frp48vrTmfPg0s4PT5uLPF7sbxnlg08pxzCsle5k0O25dsOW+lLj9C7z8hpvdOnzhB
         1Fw/YsHmdzLL6+QLIgfBY/kSbq27OIQSsWAxE9Jm781Ey75DoYrlKsle2fs0diwLiHco
         5d8K6G21mmZzNVL88m2F19TFHuYSJjXmdq9dm2zGh5wKGaFj6FlEIUX3I/14MpxBzD2R
         /5npw2DUKdKla1wHpLvLEo7adiYIjz3NIDdrcowDkIxajSkqvteUt02CDv7Qv4sm8isU
         eNDpL9HDw2dGfUOArkx46YaamumFSuTkOY9bK2OkUcBbrGuIsxRaylwL71WW1AvWMR2S
         9f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760693704; x=1761298504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sefhtiMhuuPq8nFOLwvYqf8fe7o6Hmrgpdt61rNn/I=;
        b=k3PY4VUVS7XRMQrn0npeDrWi2Xf6O3zjyECy51gvXec2kuw6LRlQrudEUlAOf5Ji4Q
         VxOXkm0lUXmVoZVzGbFdKgEoYpfkyZZto714dd3BTbSZ+DFb2x8bTjyZM1Vp0+YvvXeH
         TC7no5AJ/LWXHy21WCnjxiYie3dI+koPwdNFd+auQLLr0woVdGB+SjP8f+gVATflrOb5
         HNcIkbG7hG+7iWQlk16ieyBwWVE3eHxjKdm8WIjsn1RrbaQP8Ikv3Gi9Kv+8NjtUeo6f
         IRV4tYjNTgNeqywWHJTRY6JfXqYxzgLPQx2DvEsj71MVuHPUDxa59QKcK04a/oPRhFs1
         YthA==
X-Forwarded-Encrypted: i=1; AJvYcCXM9P4nVnr3c302zmX7fQ5gZlmoAKqJVSjzLtVhS2GNiwwdu0Fb0WGhL7BZB1y5PKiya0MtH9Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXDGFHwjTM37I69YM6OiGXUnQwR5uyNwJaP/QHX8duQos5XH4+
	fmdK2n9sLnFKrK1kY0IW2K8unPYVxltpyvZddyVO/bSx/6aehxG1NzBB71dJlQ==
X-Gm-Gg: ASbGncvyPd9zOxU8yW/gd5Y2Cb9tZCCUNtZfioKfePZcD2qvO45tnBzhxcP47ac3IJp
	XIejJ4yLL/7y/tB2d4xHQiFB+KSisDllOkp/2FwOUi1vglcU9SKjJ/svzAeYO+SD63b5/1M8uF+
	+nY2R/Xoz2dOy1t2eJdOVMEiCQauMfQbTF5nR79k5ORG2hyqKaZfhwvrK3FfNvCla5rJeEkJ035
	HxlM9laW9FmBitEoukUMjgOtqX42jfTC1yBnzVXFPYKP8ufjpu9eOMtpKb8+gEjMR/BdxRZki8v
	fAhNXoIt9wvhO0N+Mgb34m82ZTMAhE7IViEE0VL65UxbsEBNuewc6YIBX6v+B0T2LSRL4/sScrV
	NxER08oKmoANTsjy6bGwc6sYH16Y7lmJmxAcMbUZqNpibfWOcns4ZDvfND4zTavALlc9n/PkFnf
	5+
X-Google-Smtp-Source: AGHT+IFZ4r5YhjGJi2lIzlRtB+okPhBm2JAHvMOho4Si8E/kA0x/N3K19f//5A+MqBicWT22P9DP/g==
X-Received: by 2002:a17:903:244b:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-290c9cb77d1mr36187715ad.18.1760693704058;
        Fri, 17 Oct 2025 02:35:04 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099ab4668sm57316645ad.90.2025.10.17.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 02:35:03 -0700 (PDT)
Date: Fri, 17 Oct 2025 17:35:00 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <ief5lt3mxa4epnlhwgsx7kvi556f3fo3gqff36hmzvitexlphx@ztpueijr5nb6>
References: <20251012022555.6240-1-looong.bin@gmail.com>
 <20251012022555.6240-2-looong.bin@gmail.com>
 <20251015134144.GA3265377-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015134144.GA3265377-robh@kernel.org>

On Wed, Oct 15, 2025 at 08:41:44AM -0500, Rob Herring wrote:
> On Sun, Oct 12, 2025 at 10:25:52AM +0800, Longbin Li wrote:
> > The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> > access to configure related modules. It includes a usb2 phy and a dma
> > multiplexer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > ---
> >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > new file mode 100644
> > index 000000000000..d1993f2156b4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV18XX/SG200X SoC top system controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@outlook.com>
> > +
> > +description:
> > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > +  register access to configure related modules.
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
> 
> Also need 'ranges'
> 
> > +
> > +patternProperties:
> > +  "dma-router@154":
> 
> This allows 'foodma-router@154bar'. It's not a pattern as-is, but 
> generally we don't put fixed unit-addresses into the schema. So instead, 
> should be "^dma-router@[0-9a-f]+$".
> 
> > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> > +    unevaluatedProperties: false
> > +
> > +  "phy@48":
> 
> And similar here.
> 
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
> > +    syscon@3000000 {
> > +      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
> > +      reg = <0x03000000 0x1000>;
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> 
> Please make the example complete with child nodes.
> 
> > +    };
> > +
> > +...
> > --
> > 2.51.0

Thanks, I will fix it.

longbin li
