Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02D33214
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118939; cv=none; b=sF7cO2zmYuyoVw5tiSoQv/bKA3L2B+2DU//a3DHo3ob+DcHA6EOjKCY79PkAky1NXoW53nT+gJcFvM8AWZuJQFtNrnDu/0Az0JQKYXWWgLk0C0+dqEFmBqWULbEERVTg4v0o/UuuY/zXHa05Xfg52XQTNmdJW77Pjin4HGHo+e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118939; c=relaxed/simple;
	bh=iOjQPZ3jBEH+A7GPIhAofmRc4XXAqWG0KCzvFh/YLMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghce+s8EUnGosFtm7qTB0C3e+X7cWVuN2DE/jdIjEsMkInDNbIPOFwxjZrcnasHXSa47WH8xen4Lac9tdTz6iWpfqwnjLvLSv1X2ttB3Bsr1IZFpRcsA+5fDrLKrKXhc/zrigJ/99WTqkOBe5YZhpzDQBaBMSvM2h6VT3pe3+LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvrCs08f; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvrCs08f"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4ddb53a10d1so1978849137.3
        for <sophgo@lists.linux.dev>; Mon, 12 May 2025 23:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118937; x=1747723737; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYk4j7CxjdKvx7rPEEhNb+Rwax5vZxTzKDR9+UW9Ueo=;
        b=UvrCs08fHPj7oPZwp3BhueVL6WA54F2hxmb8sSVwOHwd9EhgdWPAoFNbN2OxMeCk8V
         HAJXq8fju9MRNVCZQ5P8YBT6qQWEKUYpB9n7iKp7W7kjB5FabevbPDajkwciw6eTJGV1
         hfDNx6JfZSEZZ8WnMuLPEV3nZFT4B+oGMU7p4V4rcKXftiWg3iJm6Pn8vIxP7RXHgreM
         UB4hTwqcUc6is8EtJxHFnxcl+xsJWQjsBvYNb0URSQGy43gsVzRmeuq0p+EfSnL2TCGw
         2sQub2A/p3Dz+8KOe8TkSBfS/krLBjC9jNAIbCn9PkSQIZSk4U7J7IamiNmaIv1QzBWf
         5ReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118937; x=1747723737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYk4j7CxjdKvx7rPEEhNb+Rwax5vZxTzKDR9+UW9Ueo=;
        b=OwV5AWiIIh2tHBz+7ASRAltz+KEvQT61okhhb3yq9RHznmH9wwSzBg3n1Co0uhT/dN
         OMx0Yrm2MQZizf3doXZdIil5Tb4dFtPP77pIiDI2viiFeTwT92PFNpqgLGipqX9GgHNT
         JsLmGzqjEGxC7xP9f8mOP1dJDut5uAgB2L0jSvbo0OY9aFrDGb5fG4IoDvC0Y4/0q1JM
         KL3Wxom7RHrrF+20RwbDWY2j26qPLz4V0T8LkuXooWGXnUvlXrHFZgg96hTZdKrU4SlO
         3cJ0J3ceRY9e8WU2kgEb+GYETFQn8P4+ucvIsp/RtQige8bhe+dBym1MSrlkSgQEzWjt
         yaWA==
X-Forwarded-Encrypted: i=1; AJvYcCWwHoXRfMFetRbPovU2Pn07iuMJ/h8RODJkpvv/zJbV1urat0Fy/ipbm04Gj04VfsmfL6tH+Is=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk5DSrfAz7PQdUCmx/mjz09ebdC6sJF8sO530rLdkhBApdfTJs
	7Gvq2nym0JRlolSZOuevXmBi/P5Rv62mU9pf7WgrKs64gBNCoBM5KtQxsSM8CqKoHWXfONKDrGB
	uFWQDCNyGhI+kIPvJPGrf2mc9ToY=
X-Gm-Gg: ASbGnctZ/wBOGveq0NGzxdcgQ13SnKG4ymit07+XZON8Sxc1o/flYuCxmer7KBF9MMQ
	M95hb2YsZPb6GADP0E0BbioaOOdcnaoJ1AfEaFjffr1hBEkUUj6EXyPAJ4SHX016h1Wh7n4FWAD
	UWdV/6clyruT6dpNNqllrHGBYeFQz/vqo=
X-Google-Smtp-Source: AGHT+IG1Lfo3qRxxG+d06P2OThy1PUAW+HmTxa7XW23ERubEx5mp17bOS5Sq9QFl3olPcQ5JCsTf6WYuihxd2eQtVjs=
X-Received: by 2002:a05:6102:3c9f:b0:4dc:81c9:13b1 with SMTP id
 ada2fe7eead31-4deed227f12mr14095269137.0.1747118936072; Mon, 12 May 2025
 23:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1746811744.git.rabenda.cn@gmail.com> <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 13 May 2025 14:48:44 +0800
X-Gm-Features: AX0GCFsgKP3_L5fxA6GXcGzKEQ8-JYRcBHDQtkNoE5k7A3nhuftzT0fylh2dtec
Message-ID: <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
To: Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I hope it is sg2042-x8evb.

Sophgo is also making EVB boards for sg2044.

I think a distinction needs to be made here.

Regards,
Han

On Tue, May 13, 2025 at 7:35=E2=80=AFAM Chen Wang <unicorn_wang@outlook.com=
> wrote:
>
>
> On 2025/5/10 2:13, Han Gao wrote:
> > Add DT binding documentation for the Sophgo x8 EVB board [1].
> >
> > Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG20=
42-x8-EVB [1]
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >   Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Docu=
mentation/devicetree/bindings/riscv/sophgo.yaml
> > index a14cb10ff3f0..ee244c9f75cc 100644
> > --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > @@ -34,6 +34,7 @@ properties:
> >         - items:
> >             - enum:
> >                 - milkv,pioneer
> > +              - sophgo,sg2042-x8evb
>
> I wonder the product name is x8evb or sg2042-x8evb?
>
> The same question to x4evb.
>
> Regards,
>
> Chen
>
> >             - const: sophgo,sg2042
> >
> >   additionalProperties: true
