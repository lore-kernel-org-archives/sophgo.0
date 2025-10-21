Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F632D0C7D
	for <sophgo@lists.linux.dev>; Tue, 21 Oct 2025 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761039317; cv=none; b=OLRQoTjcEo36J63uohIJWJzUOoeWSZ5TEjdqP9xL7SzrxS9ImSxriLjCdYi2Eydv3LH/Ll6i3HcDmlFhdPyYLZDH+XEDecqpN3TMcwfb+VYKUKDE1M6zEB3nMUkiKYOP88DQAE17F/3ibsvJJ2gR89vu/Df8Et+RDPvaK+TlWrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761039317; c=relaxed/simple;
	bh=bcpL8irMMM+I6nfVnxAplLJBqbQTjzwjMcmHCIsz5gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3d18priNdp07TqkwaKRz+74+my/yE9hfQ2Zrgr7dsuq1lsq4ZxGbMaSV9IfYw8z6bgT6XkWpjTGXmklypgWfCpDCGITnwf5qtErK8nLdqqLQ4sFiuAV/6mNVs9oBf6GrLwu+F7yrSyKbqIVoCkSIAuJkOVevw6EbMZ5B8UDQCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTP1kmLr; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTP1kmLr"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-781251eec51so4212120b3a.3
        for <sophgo@lists.linux.dev>; Tue, 21 Oct 2025 02:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761039316; x=1761644116; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xdLn1ynyVPZ4dxUpr8ekiQALFxRstWPAZs5IYw4es7s=;
        b=bTP1kmLr1e7zP5AiGCu/8hfWUAGDecsiiOjiUY43po7kuJpWRk4uQZSrPZeQleOY6l
         p/EGNj7OFmSIMacbC1aG0B1UW+uhkzVT9lzlJxEl6Odm2zQK25Cf5IzUqCOylZQf9crH
         SoxURyH0EJf4ZF0LreUISu/ikxanSXaMnjby22k+khrR21fjGuM5AHEsrodCXwG+aXPV
         fRp7XicxI+CsbCSnuzZx4vvQmOJ4EgmNc2qtdXN39LdqkeAi+mcqxmfoPe2trgRYgDlL
         2XzYyZ0kiXQEs31Y/ofUORgL6W7LT2E22Y0ay6apmUZytlwuotut5CJhxBGIcOxM+Ujr
         tn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761039316; x=1761644116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdLn1ynyVPZ4dxUpr8ekiQALFxRstWPAZs5IYw4es7s=;
        b=qLajqiriGK15xkGFSaRvznDQl3+z/dQOTzo86dQmjPNiNWAGfjR9kfj8dnzVFXSEPp
         ABa9+b3SaN59fJhm6unvTvrTqritvMw/YE22ns4gqYKbKCtUVzBnfz0Vvoo7Ie0I/VzO
         gUqTwI+fhA3t/fv6edx9QJ42tQmYrhlkid93gGF2TV23TKSkVce4hIjZ7+1fZosra9tF
         qKuMT50t2+uv4VXFahJGv2V6tghJZ5KARmPUtxhkHUE1o/scWAoYUZsLHFmizmht+zp5
         i+l6+SD/8cy28MFQfVnoVk3AkJaPUPe5SkWo0hHWkaYOECkkBX7TbSGA7Y0Dt3gteidF
         jHRg==
X-Forwarded-Encrypted: i=1; AJvYcCUX/yS6XvHAFSm5h4bkh+sliVXo6A1QBekxhHvAy4Srn97VZbH0kFFvFx2SveoIHUlxqH5HT4o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzV8vMgf/RFprDyuIxfFqZoG4KW49sEbAHzinpVhi8530xtc4XV
	92WwSom1OFGcr4czDC4thdQx8HVGqTaSadxDHATLrHmfniVfvFFDnLK0
X-Gm-Gg: ASbGnct70Xg7yaAup8XPuIIWjlacrup/XOwtxIXr7djbn6+IJWqEsW0/zasHEbwzCWV
	1Ym9fioawsx0ShgaRhdAPn+PNcHqe/3xp1/K9Zm7vf+nCqCRtnjT8iKf7a6ZBmAv9Ot523Pz6IX
	3bjLv7c20pf28iqMzWEr+9Fadp9K2FP6+Xx8POj3FKuEW33kTzDLoiTaq9z/oD75s8B/DTX+nS9
	N2Esxu8uvrYUW7vFGzMfA2u2Qi5dxIGtBkwONUbX0zEWXKwoMyfgk9SGPtnsBXCh8HYQyTWt8/x
	UkTyJMcSACTBDeiHCaY9CpyL2Kls+Ht1iUMorchpVALCy8ZqMOigQlmSx79sSAeclWj48KNvj+S
	8uPy0ZHOMXJO/XQ6nCbDCf41cZvod8uMMiiqKWukMmqoaqiCOK26EVNu3rWghgD561qgC5tDOn3
	7qfkA+19rjg4Q=
X-Google-Smtp-Source: AGHT+IGFkWwUhKlvX3wjqRF8Ewtzj69yE0Ksx7a5SqOmni4nW94Y4t7Udab8ZYZ89rvlIzREH0Iieg==
X-Received: by 2002:a05:6a21:328a:b0:334:a1bb:5898 with SMTP id adf61e73a8af0-334a8621674mr21770370637.40.1761039315601;
        Tue, 21 Oct 2025 02:35:15 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a764508b0sm9918642a12.0.2025.10.21.02.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:35:14 -0700 (PDT)
Date: Tue, 21 Oct 2025 17:35:12 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] riscv: sophgo: add top syscon device for cv18xx
Message-ID: <c2b4zfjfqqorku2oznpwhvk4mwfwv4sypv5qxi2pk4xsxknhnz@o6euptpneeqk>
References: <20251020083838.67522-1-looong.bin@gmail.com>
 <62bb4f8d-ffbb-4529-ab0a-70fd8c77078d@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62bb4f8d-ffbb-4529-ab0a-70fd8c77078d@kernel.org>

On Mon, Oct 20, 2025 at 12:04:06PM +0200, Krzysztof Kozlowski wrote:
> On 20/10/2025 10:38, Longbin Li wrote:
> > Add top syscon device bindings related DTS change for CV1800.
> > 
> > ---
> > 
> > Changes in v2:
> > 
> >   - Add ranges property.
> >   - Use proper regex in patternProperties.
> >   - Add complete example including child nodes.
> > 
> > Changes in v1:
> > 
> >   - https://lore.kernel.org/all/20251012022555.6240-1-looong.bin@gmail.com/
> > 
> > Changed by RFC:
> > 
> >   - https://lore.kernel.org/all/20250611082452.1218817-1-inochiama@gmail.com/
> 
> 
> So this is v3, not v2. We do not count from 0, -1 or -2 (of you have
> three RFCs). Please start using b4, so you will get it right. Otherwise
> how can we compare versions between v1 and RFC? Try yourself with `b4 diff`.
> 
> Best regards,
> Krzysztof

Sorry about that, I will fix it next commit. Thanks!
