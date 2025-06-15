Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC99D2FB
	for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 01:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749951657; cv=none; b=C2HZUthYMg+rnjtWBf8dQ0nEsB17CwArvoQjn5XSUxECeK5KO9Bwl+Wr+zQtZqdaNnrhHXbdY9fc8z7Vyj5MlLAd09pEmKwQJ4w0OXj3cLB3QkfIxUgI+55XaK5k+P/h7VuKmLL2sd2N7hBoFO1jGziM3cubLeQ9ZeLCLPLWc10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749951657; c=relaxed/simple;
	bh=GMEtceewlD6VKs5/n6rbS64AhkxPBpl2yxdCrLWVOjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEZGZU7Hxho+HOLp108Swi14uKANtLxkHZZvvCYtTu8WJ8EOLBPech1Dm96L05RmxHxwNlaCHrKnIW7Gcz+flrsYpLhkuO6pFNK5qSLO9oA3Rvf7YcHc2P4i1pKGAT98n2P24Mv3KSwSx2N6hKpZ4We16RHTJPXpseCOqX7SwtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmbNKP+9; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmbNKP+9"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso3251453b3a.1
        for <sophgo@lists.linux.dev>; Sat, 14 Jun 2025 18:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749951656; x=1750556456; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NBTMddD1EgJ5XqpJb4wGCf6dCboYJMy04qeMI4QwNwY=;
        b=kmbNKP+9Eut0pKJdIGo5qhdOiFDdPMcxJpeBtMEsObR19w+S4htEQOLJcDuHdHB/I/
         PTbjO6bq7KPq9lC0IWbCUZ1FY8Id02ieuY6cTXpO+JP3X6p8twWUvgx5e0SFFVUZe0rr
         Gq67ZpsHNRyyMb7e+Anwy+Bbc0gYcI3chaqXrgly252ytaJLYXK/iYfHHcE34W2rZXp1
         PL4Mz4aCJ4pocUcoPATe4dt4T4RbwZE7GpTNheKepIdgdx4hm6mljnD9uX1WSo49R+S0
         eyd453ZSvXdYNGhpHdc1dty31IOsyklx9ko9YpdO4g8Y2S44UBz8SxQH/nbyAu5AFBXV
         U0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749951656; x=1750556456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBTMddD1EgJ5XqpJb4wGCf6dCboYJMy04qeMI4QwNwY=;
        b=Yw2XZWktlGyLaG98sZdbVt5J5XYNLj8aZj4IgdbntEWPfh1f/Z36GxKwQo9mKn4BEK
         oGiY0EfVACfvBGgg88SLXekMJfX6Jx3Fe1ZBu2uoG04ufB4BMWumcUdel6WNw1TBQIST
         MDYLYExu1yKqIJgMXAe2LsDfaD+o0brqc3oCcLsMnDtkmoSTINSPznn0A61KXuZEm9tH
         9ZrUDF5R4cjn4qAx/zjHBRnyR1Qo+OHMVV0hfpbfyj9u4tDJN1OQ8GQZWUvVJXBhvn/6
         QNPu4gQX6vMvoVrWO3q7o0XfGhEK6eo4a33JPgPyB7Rb55fXctSBPONyVfsWqHp4UKkO
         jXFA==
X-Forwarded-Encrypted: i=1; AJvYcCXndvTL9SW8mcve42XRgg72enC2X+mZdLTzEvjFT3XZokZ1e3+V2xa7DtraVsoT+GtcMg20IwY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqAH+d9Fa+hr0Jj7fVRzEEtohdliMHFKKt+5po8JU5WjSlCAuO
	Mgplc4W6O8oMzfAUxBcvMZs5DRlXABgRTHQgSBWuqigkTdg6lyi7aDFn
X-Gm-Gg: ASbGncvuRrziLnkPFTca8WzmxDqcdq9i+SHTpyPWOgzsSjw47N0diysmOO2gLVDynE9
	jsPUx0cgyDTcY3aPGWa0t/hSmALUlN01DN8zYDFBmKjHWWZ6tex9ERbrGjz7I1zf4hvWxjQgyzI
	DMmR0roH0g47R8t9eaq6xQfBKZCmW3+IG2R/o6s8GEZNIP+kRkGHI9/IctELIjXqnTC8i44wnQq
	rwtPQ+UO6hkNfLOfbQzmyVqXptbettPX0luNiRI5+E+2eSODir53j9xTrFfXiqvKdluphxGOUVY
	40NB0Xmmj7e7zi2klIdvihFk+dzeUvXAwqaaM4WVYCdoq5LAiZY0YaMoIMtQ8g==
X-Google-Smtp-Source: AGHT+IFFtgSTT239FlySASeK/tmHjPqITYuVff3RfVuRfyAgy5DMcBJfIvR7fWesb8KRVOi1bJOajw==
X-Received: by 2002:a05:6a21:9ccb:b0:21f:52ed:23cc with SMTP id adf61e73a8af0-21fbc7aab9fmr5594335637.15.1749951655619;
        Sat, 14 Jun 2025 18:40:55 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7488ffeca93sm4005306b3a.20.2025.06.14.18.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 18:40:55 -0700 (PDT)
Date: Sun, 15 Jun 2025 09:39:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <rsem5lx74zhfqmb3adljeesyhqtwf36asacle3jyo5kls4aadt@qmnve7qvctq7>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-2-inochiama@gmail.com>
 <20250612-siesta-verbalize-6a7768ebc648@spud>
 <jf76ak6b5edgqhx4rkhcsfpmcpkrxci7rq373ld2apue67q7hh@3fb346tgaxcq>
 <20250613-deflation-aerosol-fed1d566fd0b@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-deflation-aerosol-fed1d566fd0b@spud>

On Fri, Jun 13, 2025 at 03:29:44PM +0100, Conor Dooley wrote:
> On Fri, Jun 13, 2025 at 06:02:27AM +0800, Inochi Amaoto wrote:
> > On Thu, Jun 12, 2025 at 05:07:37PM +0100, Conor Dooley wrote:
> > > On Wed, Jun 11, 2025 at 04:18:02PM +0800, Inochi Amaoto wrote:
> > > > The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> > > > "VBUS_DET" to get the right operation mode. If this pin is not
> > > > connected, it only supports setting the mode manually.
> > > > 
> > > > Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > 
> > > I'm having a bit of trouble finding the v3 etc, could you provide a
> > > link?
> > > I think what is here is sane, but I want to make sure that review
> > > comments on previous versions have been addressed. "dfn:" searches for
> > > both driver and binding filenames turned up nothing.
> > > 
> > 
> > The v3 is
> > https://lore.kernel.org/all/IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com/
> > It is a long time ago when sending these patch.
> 
> Thanks. I think this patch looks okay, but probably worth Rob or
> Krzysztof taking a look, even if you seem to have removed the props that
> were objected to.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your tag. And I will wait to see if there is something to
discuss.

Regards,
Inochi
