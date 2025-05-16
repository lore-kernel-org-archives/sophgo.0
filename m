Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7973E254841
	for <sophgo@lists.linux.dev>; Fri, 16 May 2025 17:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747415521; cv=none; b=b1ietaS6AQJCCsEJW8d8rvJZe83t57mqQDWRddXJTcrEzdJNRnESpEVqOksCnyOdrGKymg3JPnXa2yNNCUiJBM44HP8SJvs99fqZquPG1rWkUjSGRdQ2KFhscEPOUR35sYt8Gozkcf8YSKxXl4LLw4BydCHSJK3N4GMO55+X030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747415521; c=relaxed/simple;
	bh=OmRKj2XGoYIJqcdUtZTOASiF24tdoRUpWqZw3F4eErU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3RZczD6hCPTEEDiDFxQcqM3dloB5gH8yLOkA3PPRhcS8x+GpEbY6GwArM9DIEpZ+4CGBh6AXAX3eamk0lPH/qTVBsaw5MmYmgBIFFD8WH5ZWAle8At0evySwoTMfkgjX1efqdvh/UCOG03GURjdQak4FtEiww0zwhKA+Khez9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=le3jJa/Y; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="le3jJa/Y"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-525b44ec88aso738956e0c.3
        for <sophgo@lists.linux.dev>; Fri, 16 May 2025 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747415518; x=1748020318; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhDH5x31OY0sDQlP+75NDdLaYCVS3MYscT17OHcsFQo=;
        b=le3jJa/Ys7zo/M7y/N6gOGuJ12WEQZGkr5ogI3AXLtcZbBAomskNP9nY7O7dtvv6J4
         3tO7IbVXbHg+KDkYEgjLMPVELJWydYZ12gvLmcnhokljC6nTT0S9/lYi+w3EqylDGplj
         MwAxkK6bULHbxoh7BCKm3wurMKTNRkVLAQB6KfDyXiSuMqtR3s705u4OScFY52ckg/5m
         An9rR/2mC34BeWZrWsBZxkS28mxPLqkq7LZwH3M+G20RgM71KUJrOpO3AuiCx7rMfQjp
         lPThGqXZBYIBJNqkGfw4rDRQWhgLguOb9SKe1j1nZ3BuFOyCeN6tt0EH9DrVXmZYGlkl
         EjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747415518; x=1748020318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhDH5x31OY0sDQlP+75NDdLaYCVS3MYscT17OHcsFQo=;
        b=WMgJ23ZVbGtjV766gwmVug7KH0Lu7LnqtbgiIqwiZ9xpuVvC4VJWAWAlsOpHCS2UgH
         huNVFV7oYJB1JoNJaEg2w20bfKmCiYfQ6t5ie6b/I7032Lw6qUbbVHn40AkllGRyW55Z
         lreGDlZVEQfpH1CYZ6adUVWKzSn2UxA+pOod6CSxkBfOPOTmL7DSXUSlq7cIilyJjxXq
         r5BCUedzaMRJNOGpf1GN8Pro8vQNPjSmreAlqesWhHoiuFt8+AM2trLOhUximOd5f51B
         gFSYp+2TU6FIFXzFh6DDOjwH5+Y8r+8LHQKNu6UC27QcIHTXGbQcl8ALhX7c8FV/5b5g
         wm9A==
X-Forwarded-Encrypted: i=1; AJvYcCWh+b9/9jEFT6/iDg1D+Z2xwjBxpBbIIhKFr7QjKw91ceHRC9b8ZxnZQtaRvUIMhYOExng0ZSU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzLrKvZODESZX+7lvdiMQXvLLA9wRV6Sg6DXKDg0N7KOmY1b0z
	drX3xbjugfPOWPq5yZgMJhe4NUb1H7+A7BvlMcPL86F/ZHah1d580IJxmThBjmR7TBFSONC4283
	ugpQpocFdC0lrqzWsIQie8zsXCd7cgiY=
X-Gm-Gg: ASbGncu838DPEoEAB3hL4b4ZXjRu5GJbCCdzQDrXwBgf7sfNYu6qqtMXSvvzvfk+JIu
	2wbhgryhY2WloTq1ZaZxFH2no/bWLH/NWY33C85m42N4341FcxrciQT3BfGpVaWSM1mLfAtRP6s
	f9hwrhTzzcBJQhylttG4l17sZXUfjky/A=
X-Google-Smtp-Source: AGHT+IGCHH91w5aLLk2zhH1OD0M76Qr/hbRf+ItmTxpc3fxs9gNjUQOKE6DSW7gfQpTUGMqdAkdbaP7RWiKhTiRaV/Y=
X-Received: by 2002:a05:6122:221d:b0:520:61ee:c814 with SMTP id
 71dfb90a1353d-52dba7fe312mr4755074e0c.1.1747415517612; Fri, 16 May 2025
 10:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1747231254.git.rabenda.cn@gmail.com> <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>
 <20250514-showplace-yahoo-e3c306355288@spud>
In-Reply-To: <20250514-showplace-yahoo-e3c306355288@spud>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sat, 17 May 2025 01:11:46 +0800
X-Gm-Features: AX0GCFvBGlC7lcpTFlf3PZ0KsWEj3nP-8_pPYriZOyvUH2LtrlBI49XleAD1C_M
Message-ID: <CAAT7Ki9Fw0+Ntv+oFqr2R=EHnFZrT6KmyTPN2MCDDGvSn-Wi8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X bindings
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 12:22=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, May 14, 2025 at 10:08:59PM +0800, Han Gao wrote:
> > Add DT binding documentation for the Sophgo SG2042_EVB_V1.X board [1].
>
> 1.x? Is the v1.0 something people can get their hands on, or just the
> v1.1?
> What differences do the boards have that are minimal enough that
> specific compatibles would not be required?
>

First of all, v1.1 and v1.0 are compatible boards.
There is no difference between v1.1 and v1.0 from dts.

Both v1.1 and v1.0 have been discontinued.
About 80 pieces of v1.1 are in the hands of community developers.

> >
> > Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG20=
42-x8-EVB [1]
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Docu=
mentation/devicetree/bindings/riscv/sophgo.yaml
> > index a14cb10ff3f0..6c82f89b56ca 100644
> > --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > @@ -34,6 +34,7 @@ properties:
> >        - items:
> >            - enum:
> >                - milkv,pioneer
> > +              - sophgo,sg2042-evb-v1
> >            - const: sophgo,sg2042
> >
> >  additionalProperties: true
> > --
> > 2.47.2
> >
