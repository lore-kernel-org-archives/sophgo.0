Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D161624D5
	for <sophgo@lists.linux.dev>; Mon, 23 Jun 2025 06:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661419; cv=none; b=Bh4vCSI8mHe3SINXJPmtHXOWrI6bClWxinMHh4xdoVX9KJB5G4wUOPP4b9ka91qI/Q6BVlOunuh6+6aDECgaTGQUQGcd4Yj1ctTi0STf7uPjbRd5JIqz53vHfPv/5kqg08vABpHTyDj3TkZph485Tajn1djlBMIw74U/QFl1f9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661419; c=relaxed/simple;
	bh=gUcXvmQE/4OGkPu+1pWmspRNi25l7Kd4ITJO6J0F8GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2DIq7u59DG/rwfvTVqwU2Uq6gh7bFqEuKT27QkeR6bMw7RhaylvEMvMuqv+sG+cOd3n0w7nQYrLMyRZ20tbPBp2nyU1vL8NoFptR14fpEk1QyMPrpRNRwXNJOM9yk393ljyhsi2Zv165AZeKvc0Kkre+rtgtFjV+vAKr/MlHyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVNrxBx3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVNrxBx3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-237e6963f63so7356035ad.2
        for <sophgo@lists.linux.dev>; Sun, 22 Jun 2025 23:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750661417; x=1751266217; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6pa7zdu2J08RltO7Fc5iu0znoovQ/LLzNNFFw4lTRcE=;
        b=YVNrxBx3+0hRIF+XxmqOtt6NFJXW2Wtavx4F89jl5vWZYRtMxAwhrRFF6axjHucmai
         mFSoH2gHBWFq1nvQSIboHR2uBwQe3jrFnFUL/x4c/woEXq7TbxhQ1kyw4Xehj+QfuGGw
         zVjkS3czBv7AktG2PllwpDx83YYjgFKiO0nuMMorj1QJB5dql1zevvtmXBE0MDN//lbj
         8i7IxjxRKXDV1u07WRFD+MxG8BvihNB1xkIT1MBsBUXZPtkbbv0d2GiSCKLUYjBF2zBg
         s9ZzI/UoUF4IGHOpKErAEA2B5FyAZfJ6mse11aAEnC7Ww8pZuhZC0i8RKTWQNMZE8c1H
         MibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750661417; x=1751266217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pa7zdu2J08RltO7Fc5iu0znoovQ/LLzNNFFw4lTRcE=;
        b=rSiKYouvGY7I7chBScf8jEUS5aDVdqfLg/mGYXZ4RKzj7WZaGWl2X58bERvZE/FWCH
         XILswtswJtSQ9w2FwQsEIjYWseiENJiCTyxkjhvYe3U6twWSZJN/55Js8O0K4SED1HQv
         HlXM2OXd5zj9qUXUI5ay4YOhPW7whSPtJItlsK4cMiI3mLIHcm/yt2TVViVD0GGVuDWm
         X1x6qAzB7DnfEFVZnEpOu+hPDhqekPIZrvR8C1Qhk99ZjzevEPAwxtyhRU8/v6ZC2r4x
         cDYc/eDkDyrn5R5uavZy+eY5fMJof0ocB1sv9aId9lmTuPpD2M4ueBJAf/4io7c7JDkK
         qVLw==
X-Forwarded-Encrypted: i=1; AJvYcCUTGA29WpftyBV1bd9OKBmJlauQW6STLINQS33JsX4PiAZqf+/rqjn7WbZNOdf876i1acEYR8s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvRlu3hD1M60p2sFNZcjZJPrGoJZgfAF7a6cjkQFi6rQhWQhpp
	6NqCy2vkjY92bRGPSSnu1v5vF8NguyK6vlCEh3KERHDR8U3MH9a1z2ZE
X-Gm-Gg: ASbGncv+KrGpPINgYMH6bjqMD8123xRuyELjcUMoXLAEJiabkjGGO1YhPgJ4YxncMFp
	UwclxSy6CqpPi957XmCQqPNVxiprmFl0hkvDBbrojyj9TTc4osD0sC9dKh+RezK9SkIEu7MbcIh
	zlMYC6WXF5gVHom08Hif7uknYSn+FEurhh99WhI2C4xnNTwunM6hJmBgOLv0I8dHZFt+AY3YYm/
	/CYE6dlGY+aKnB5qsU36JceM+3IOfaCPURH0in2+gHqOdq1XT3rkOK50QEIC4Q4O39NVj0cD0ON
	sGMSlfEeHX4EDXMHHyVSP9Qvv60ppEfVEU4Q3eZVf2Sps23fmvSC+dQU8KwSwQ==
X-Google-Smtp-Source: AGHT+IHpm5rL2B+2lf3y7D/IeDkqmgR4hxP+AbO8ivmJka/IKdtwO1eRP/D1h74sTcLcDtCuBLdozA==
X-Received: by 2002:a17:902:ce85:b0:234:aa98:7d41 with SMTP id d9443c01a7336-237d9ab0977mr168116245ad.42.1750661417171;
        Sun, 22 Jun 2025 23:50:17 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237f7f87676sm17710635ad.122.2025.06.22.23.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:50:16 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:50:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Maud Spierings <maud_spierings@murena.io>, inochiama@gmail.com
Cc: alex@ghiti.fr, alexander.sverdlin@gmail.com, andrew+netdev@lunn.ch, 
	aou@eecs.berkeley.edu, conor+dt@kernel.org, conor.dooley@microchip.com, 
	davem@davemloft.net, devicetree@vger.kernel.org, dlan@gentoo.org, edumazet@google.com, 
	huangze@whut.edu.cn, krzk+dt@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, looong.bin@gmail.com, 
	netdev@vger.kernel.org, pabeni@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	richardcochran@gmail.com, robh@kernel.org, sophgo@lists.linux.dev, 
	thomas.bonnefille@bootlin.com, unicorn_wang@outlook.com, yu.yuan@sjtu.edu.cn
Subject: Re: [PATCH net-next RFC v2 1/4] dt-bindings: net: Add support for
 Sophgo CV1800 dwmac
Message-ID: <2rqpe3f54peuuslzu2mtbqt2ee7atoa6j6xiudxrway32vzmui@2apefxcrdhpi>
References: <20250623003049.574821-2-inochiama@gmail.com>
 <4cb09d05-d1f2-4d34-b3f7-be523b900a9e@murena.io>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cb09d05-d1f2-4d34-b3f7-be523b900a9e@murena.io>

On Mon, Jun 23, 2025 at 08:40:35AM +0200, Maud Spierings wrote:
> Inochi sent:> The GMAC IP on CV1800 series SoC is a standard Synopsys
> > DesignWare MAC (version 3.70a).
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
> >  1 file changed, 113 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> > new file mode 100644
> > index 000000000000..2821cca26487
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/sophgo,cv1800b-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo SG2044 DWMAC glue layer
> 
> This looks like a copy paste error
> 
> kind regards,
> Maud
> 

Yeah, I will fix this in the next version.

Regards,
Inochi
