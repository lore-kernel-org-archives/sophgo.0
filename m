Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4598227AC34
	for <sophgo@lists.linux.dev>; Mon,  7 Jul 2025 08:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876066; cv=none; b=ui8LW/bu4sI7U7WmIWhubxIMhWlg+3dNh8Fxw59W0x4UFYAzEfBTdaBhYBTSNsuKRWa0sH7QBsHpQl6xWN9UiYUm6u5JcrI7QIAeWjPJS+tXWPV48i1UaPnn8iKkOfTvgIYPABQ0itUkQM3djZWNNuRPN5MUXmtUpnXAq1tcyqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876066; c=relaxed/simple;
	bh=j/EfETJ5tR8iCf4VFrMtzkCu3pynSK4jYHPhvW8aK6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFNTZaMRVgeF5sz40Iz9uMsqKvE6gQOpAtl+fz6pzzbPx5htU6XeoOPC6dXK9zFok6180FrMxufwWyPUibVw6ChRrdxpOrq7H4rU83pZ8qMWNwdwRJUWMLC8LlPBrHd5gGSAViF5ZNgTygfiBpkduk+t+8io4J3DOUPIa3fASOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qf+NTGNz; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qf+NTGNz"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7494999de5cso1628739b3a.3
        for <sophgo@lists.linux.dev>; Mon, 07 Jul 2025 01:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751876064; x=1752480864; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=33n3Zmlj7DYucwJdMVh/vsniipGmm9V9S+B1rzOBIj8=;
        b=Qf+NTGNz4KumrR2B99uo5PpB3pBEYQ8VmxC7u2mHF3LJOO4ph+qA1CJ4OH4jdiy8sT
         cuJMQKypRPIY+M5U+Gs/VX8FjqmBx0psV1a42S05Gldx7VOEQjm/1ovk2sARbkuZbBf6
         756nX9owkE4toWkZO1EYsR5t3MRwRPRXKtgGfv9NXUs+WtiksKgALzv1ZmCH5vVKWiYY
         ei/eE+6TW/FGyz1HXC2qHIebWat4pd8lg2+aUf9hwVn+/3zwK3EJDDvriqICNR1sxCu1
         IM7xaCGAiH7w6ApX3uFEzfnSI/D1W6tkV7JqRlFZUx8R6VxI1oPAXr/Yznkj+hPHWTRu
         Tlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876064; x=1752480864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33n3Zmlj7DYucwJdMVh/vsniipGmm9V9S+B1rzOBIj8=;
        b=bd6BGUCpaE64zbUiSkOPCiMo2pl6vHhYGY3dXb0cB5Xn7HGs6Np9OMhd2fj913ivsQ
         q35nK5iHmnbNMJ4IERSp2ta5semjrfINQm+WR3gilrWPN1uDiTTMfBemTvcKDpfpa/D7
         atBs16x/m49KPqhhahbjME0OgvfBewJle3w3L4QgntrENtbdPmjzsxtvZvYLartXbDvO
         86CrOy+BRrxagbvEMxcF8Gb7QFsJFrT/5lbob5NFJuMlddLlz6KiabrT8KCwLReJAzit
         Hyrjjkf2sgaFc7lhLwQ2YW+z58ZFQePOo6e3uGUARqLSqzzGIgTL20/vb+vWqfB641v0
         0wFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrzbH1UKM5PTID3hbCGyCZ3nblp2Y/y62AzFtDD/ZJcBdFFqlJUIG/SWgfkrc0dRnHNnIy79U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEJ/eHj/BrsEyL/JRwlIb2ZKBWWZ4m4z13O9FodMAA2JRtDnB+
	NBxADWtjXi0dgHCX7ynbxme3VyTjERRoDtl4zWufKsNIUy5H5UtJNaEU
X-Gm-Gg: ASbGnctov/DH5T8JCYMaMKNPTJjieU5Dhii8xP9EcHmrnaSNIUIMn1BjTGGc1t7TVUu
	+AEyijgQbI/2KQlTqCloqlv621ezhkcMU/RiCi236Co/YkobWvO7QB0fqUDe5qE7Ij/rgR8nla7
	yxEPBoDGue7oU867lAGiv8bQB9+/Hk87cwAUpzh2lFJYOQh+jvl+sMBg0N2js0XEYyvmG3EKko8
	frUzPbornXy8CpwzAg2/H+PUYUD1gl5Y8f7v7C13CnPIsqv36XHQi+Ypz12pCqSGdPn7b43srJJ
	yWBrKTA0gnsFTyywWYricuA/LHmXHlxUdpQIdI9b8wWd6WUlFbcZeHedkU1Sow==
X-Google-Smtp-Source: AGHT+IH9UGGXQ6hFlHwJSIfy12AZEvjN28stIhe7taLm+EA+OjlD4ScraFo9JUkrX9JuuH+G/cgFWA==
X-Received: by 2002:a05:6a00:895:b0:748:3964:6177 with SMTP id d2e1a72fcca58-74cf6fbdb01mr11670003b3a.19.1751876064478;
        Mon, 07 Jul 2025 01:14:24 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74ce2b05749sm7790042b3a.0.2025.07.07.01.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:14:23 -0700 (PDT)
Date: Mon, 7 Jul 2025 16:14:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
Message-ID: <abhpvi66rhapjo6y2c7exl3nacwgtbjihg55rrljoplocp7heq@npvlgtbrieuo>
References: <20250608224252.3902421-1-robh@kernel.org>
 <ywln42bb3i5hyzlsmfbx3xt2kjbefqmcxytcqxdcgah77gcesi@2cdw3cgxbg4c>
 <20250617130924.GA1678432-robh@kernel.org>
 <mig7k5zyhmata6uvjwlwlompwf22qffwvma2nhjww3cmsmxnas@y2t5ukucs76q>
 <20250703-naughty-diligent-nightingale-d2fa9f@krzk-bin>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-naughty-diligent-nightingale-d2fa9f@krzk-bin>

On Thu, Jul 03, 2025 at 09:49:37AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jun 18, 2025 at 07:18:32AM +0800, Inochi Amaoto wrote:
> > On Tue, Jun 17, 2025 at 08:09:24AM -0500, Rob Herring wrote:
> > > On Mon, Jun 09, 2025 at 06:49:38AM +0800, Inochi Amaoto wrote:
> > > > On Sun, Jun 08, 2025 at 05:42:51PM -0500, Rob Herring (Arm) wrote:
> > > > > The $id path for the sophgo,cv1800b-rtc binding was missing part of the
> > > > > path 'soc'. However, the correct place for RTC bindings (even if it's
> > > > > also a "syscon") is the rtc directory, so move the binding there while
> > > > > fixing the $id value.
> > > > > 
> > > > > Fixes: 76517429dbfd ("dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series")
> > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > ---
> > > > >  .../bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml        | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >  rename Documentation/devicetree/bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml (96%)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > > > similarity index 96%
> > > > > rename from Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > > > > rename to Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > > > index 5cf186c396c9..c695d2ff9fcc 100644
> > > > > --- a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > > > > +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > > > @@ -1,7 +1,7 @@
> > > > >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > >  %YAML 1.2
> > > > >  ---
> > > > > -$id: http://devicetree.org/schemas/sophgo/sophgo,cv1800b-rtc.yaml#
> > > > > +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800b-rtc.yaml#
> > > > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > >  
> > > > >  title: Real Time Clock of the Sophgo CV1800 SoC
> > > > > -- 
> > > > > 2.47.2
> > > > > 
> > > > 
> > > > As the rtc syscon has a sub function for remoteproc, is it proper to
> > > > move this binding into rtc subsystem?
> > > 
> > > Does that affect the binding (is there more to add)? Looks like an RTC 
> > > from the binding.
> > > 
> > 
> > I think at least "resets" property may be added for the this, but I am
> > not sure whether there will be more.
> 
> Just post complete bindings - see writing bindings...
> 

Ignore my guess, I have confirmed the binding is complete,
so free to move.

Regards,
Inochi
