Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D935D2C158C
	for <sophgo@lists.linux.dev>; Tue, 15 Jul 2025 22:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752617221; cv=none; b=XunBqRMzyZMetod0SzXWaFIeqlhNHawCGjxK++IM0IbRnHjszjxU88Oy3JeLQcpstfLsezIMPryuVzwPOqeIM4+C7rW+rWo94tLsaYSZ2CsZy+10gZZjtsfXz/WExe1sPWmT1IWPVnuN9fbaJ9Pkr8c14cJ+uD2maU3BO5Fgwl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752617221; c=relaxed/simple;
	bh=Zufzfaszt8lMoqhAnmQDPusrRHLz87gmZprCGkIVLWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aB5n5zWs4lKAL6rakh61F3kEePHpq9J4NtcRuzbFwtnDkfn5K+VdHgGVvr/XSTHhtq+q6dX5BRooVmlMSIL+XRZrP70DcHvOi82+G3qEZEHkm3shuxe8Idvphs5m9jxBWABTQWqpHpsT49C0Z5+ztusJrEW8LY2A5c2qfyKa9ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J09LL6NH; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J09LL6NH"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b321bd36a41so5407148a12.2
        for <sophgo@lists.linux.dev>; Tue, 15 Jul 2025 15:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752617219; x=1753222019; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5+1bnGTrSGimGK3Zq/YxQ9BHvkckKvMOjIcjntRlGw4=;
        b=J09LL6NHgXRqM8BbyGy0Glk/ILX7OYN648IfFUQwO8Ho0Q8N1f/sWdFftsv/LhLPvh
         f4GHtH6s5BsFpIDUSHflb96jzJ0+WPbuZRXTLQfTb52OKiUgvTmgseLwjIgdls9nLOkR
         cw16cLlOYl15aJLquTDl4T6tiZJ5BQUpuzyCCB7kY3D6aADjQvLdyDbWf0+GgPOZZwJ+
         f/ykeOzeuEqBn2mIpgipVYA6ILbPapqH76GFKlnWwq9FcN8dK8GOgnVXoEo1wz/IqzbD
         LwECLx86yHXrx84+xCfAV/ZJI9xPw638Wp9yqNSgKJ73D5ahYz/PzesfVJWQAHrhqpu6
         vAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752617219; x=1753222019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+1bnGTrSGimGK3Zq/YxQ9BHvkckKvMOjIcjntRlGw4=;
        b=Gl7rI6Wa5XF82rtFv0X6nS0OOLs6tGzFWLIpKHTXQ2yNrBi5Py71lXqQ4pW4R+P2BV
         qxxguXrnY70CYuau4qbZAHASt6G1hIZIRVfrL+EV4HKQXL9QU1zZz+7EswXeEH6xBiNS
         sFaOLIg5qBWO/NbdHLdeE3G21ELXEkYLwqG6LzVFNbcplDm93LtHpyOdqkOLVQ0OyX3N
         tQLpPBfHlMJ8SCP6V7YFPCLIWDLmEQ0Ilu2hy9KVgjy3fqupYVwiNpgDkcvM0PRUeeNK
         Y9SsJYi02WZEV9AN+zkLdjtRq1DgjNtMxrWSz66ttaEX9ufnRsmfa9ZuOFIk3g1HMU1n
         XrFA==
X-Forwarded-Encrypted: i=1; AJvYcCU4YeRiP21i+5NIhX0OL49BAUeQabgqNLGSTmxJ3XPU/Oedcxtsm5ufaBwEM1siHctqEC0zvOQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YycshwCVZpSQORSo7D6aexK/kR2LX0R9rU6NAOLTehOva5imW37
	G8Ds7DZ0d2AuWy3j4DEMMIM2oqIpPTsoNZEjGztWTrDcbaphW82uANqb
X-Gm-Gg: ASbGncvol6oqD+Z+jp2+y3yUox01C1TSQWCkJJMhwlv+pgX0D+OfdF0nLfrd9lOCXqj
	dlQCBRdkAekrWJU/wARAsikiuJenhVM+sEdGD0EXodTziMpYj5EF8rOqlh0OfDgMVF4lA7LnBks
	nIWk0sf3Jntl+WRj1IGjA35YBIRyYbVGUDeB6vid0dpnF99XFkjo9GUyfpcOYn6MWdVAd7/TZ5H
	gTHXPUm6ih5iqO6HN9XG2mUcKhFCPdvjSiunLpCZwZpeZ4ZqsUGrbJkT6aIr2nSgPLusaEo32Tg
	IPyKQivbzJ8RJI2eTjdO+xW6sE7Qp+aPIwQ2lA0NeTLDADhJ9Aj6B33I5L13hVOTpfVXcLCM5gw
	vEeUmNtxlsr87By5oE9oeaA==
X-Google-Smtp-Source: AGHT+IGA5Go/W11svBOlx+oojZuGSHeTcf6nPxWvkyTAK/25JmtPG/Wzl0xDDQgSb4VJ+3l1d//G6Q==
X-Received: by 2002:a17:90b:2ec7:b0:311:ef19:824d with SMTP id 98e67ed59e1d1-31c9f435537mr372501a91.2.1752617219023;
        Tue, 15 Jul 2025 15:06:59 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c9f1e61d2sm96213a91.11.2025.07.15.15.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:06:58 -0700 (PDT)
Date: Wed, 16 Jul 2025 06:06:40 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
	Richard Cochran <richardcochran@gmail.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: sophgo: Add mdio multiplexer device for
 cv18xx
Message-ID: <bww3dwd37ujcnztbzw7o7r2qajwcvn54kcd6pcd42y4axfp2d4@zx5jrtcmkh4k>
References: <20250703021600.125550-1-inochiama@gmail.com>
 <20250703021600.125550-3-inochiama@gmail.com>
 <CAL_JsqLKLKHj+vQJmZnaXRj3TmqR3ELjpBc27HRbTOOP9FD0hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLKLKHj+vQJmZnaXRj3TmqR3ELjpBc27HRbTOOP9FD0hg@mail.gmail.com>

On Tue, Jul 15, 2025 at 12:43:35PM -0500, Rob Herring wrote:
> On Wed, Jul 2, 2025 at 9:16 PM Inochi Amaoto <inochiama@gmail.com> wrote:
> >
> > Add DT device node of mdio multiplexer device for cv18xx SoC.
> 
> This adds a dtbs_check warning:
> 
> mdio@3009800 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than
> the maximum of 31
> 
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 29 ++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > index 7eecc67f896e..3a82cc40ea1a 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > @@ -31,6 +31,33 @@ rst: reset-controller@3003000 {
> >                         #reset-cells = <1>;
> >                 };
> >
> > +               mdio: mdio@3009800 {
> 
> The nodename is wrong here because this is not an MDIO bus. It is a
> mux. So "mdio-mux@..." for the node name.
> 

Thanks, I will send a fix for this.

Regards,
Inochi

