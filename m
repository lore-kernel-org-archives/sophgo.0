Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297C925785A
	for <sophgo@lists.linux.dev>; Thu, 30 Oct 2025 02:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761790648; cv=none; b=qGT9C11IRcnFKHHfpTEPSLonR1rMkvjZJkvIc18Q3GHAnG+PyhpCQod3WcFv+o65M6vAFUe2j7Lh0QBpaPXKs6coOnCkxtfFur9NwhoDt8SLa4bIsDuaAd4YAPXaFOUNaMSlyAwmlABqOdxxgYcXCNFIBb/GRjJ2MgWO47dX9N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761790648; c=relaxed/simple;
	bh=/6c2y9ANIF87FTRVL8fxIK1dv+k5hC5UX09DmPr/LGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uk9DuyYwM+Av42MUZmrdDbYrrUrEdWS0khFvgkV+yjMu5nwq2qvkZoU3Z5U3J+D5Q5i3okNTnJvwkd/KQcShNp9TPLaNy2/czLcjm55XqNKtVlXlEmOo3tGbIsurxzlnzAQLaNJwzxYEdoqfDRboA9uqguPhpfOjbDzYqiMp4cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vl4gypud; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vl4gypud"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a28c7e3577so528035b3a.1
        for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 19:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761790646; x=1762395446; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e0iJfSZcYi4d+4cBtPvkDIcUkSGuJygcNQUXASJtpao=;
        b=Vl4gypudY10Bo8H+s0jzOJbCIB0XLn8duX9eDAQNYHMb8fYBoB3HD/d2zgCSEp+RLw
         ooOjFLyYCDoG+XoNjtJzmToXwH8J2/Tb3nixphn5vwqViqJM9wgke1+5kSHm5rH77Ca7
         YR9Hxuqtfna2ciUDu7jNe3wKr+whdxTg3g5E10IZAnBD0KlEaULkZhGy43gDYLci4Nf4
         H3gJ3zv8cjNXrIU2C4hCtsOT8OHsco9fBBEs+hX9oHHIMHjy9QJgyf9MNZh80UaC9EQx
         +fZvpc6dwcVrPK3sDNUlUKWoGtPATUJkluYqH3oIYJ9W8+oiuciET2tWCnnIXE/fPn9C
         gOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761790646; x=1762395446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0iJfSZcYi4d+4cBtPvkDIcUkSGuJygcNQUXASJtpao=;
        b=kkaHAzPmxz4ueYMSoS3gXYnRIZmjAK6CibGXwp7ZoBvZxPYRJkIdnEU/syLPOyFge3
         WElIQzn7rfxUUpCsXPuQnme7+mP/7uWjfiYANq27aOtdKJ0Ep1ocVkT2Rzb7lc/TA9YO
         dnbyJiAzx75UoTPq//xPKpuMaR/jTi1a3pmsj+ENV0Wo3YVm/DN/x7xCPNGgbEoLe6PF
         ascIwjO5wITTuZ54/XaoyvImITPslz+FktoJHjV67yOU6QbCZB5rayoxa4evoSFrAGDg
         teqtfeGmf7QiqvrRRheoPVH9gP+RFZvbp1CbdThRjQdJ3/ZGo0uON8xv8O1P3QnlTJWV
         hG7A==
X-Forwarded-Encrypted: i=1; AJvYcCVvvOwbhpUvoa3wFX1VFsD0DnueJqa+2CCDb9nsN8l9iEQ5O3WVBUZtm++6ymXh0NzvEpqfipc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7b5LZpxrGoacABV5/RA86DsWc5KexJ98m2hPAYIAuUyOhO0H+
	y/YXQqju2W3lDk+gT73o2cpLW70Tfa9YfrmNFa6oOpYv0nUEU3DS0T+E
X-Gm-Gg: ASbGncs6sIJWuot6bjlwwWUoY0eGqXmGiZ317bIwDq8XuEHksxaN5yWQglmHjFPCwj6
	5KaOiHHKZ2ix4Ng6Gccp8hMLUs8dRQnSdYL7Uo0c9mzod+/6OxSJMze1uhgrwAhFywGqxdFUuDr
	l0imjv4p0xM+LQoGo/SSKbUpWkS0EYmR+1u9U8qUJjcv8CljLF6i7aMHHn9DKKTjo6/zqsGscny
	7cPxwto8m7ZscGzzGojZND2XAVKnnT77Y7oHxYNQq5wBcOfgSH9XFsMzzL5nZNepvKFZufsXZT8
	vzebA7oy9cHZTRTQMxhLaPny7Gns8Mhi1GimvXKOpiOT/nbeB/QvMFEMvcL+8EpeJ2vfdZeEGUJ
	EU2/9vBLWDgA7MLcAIjizE72tjpFq5LuPfKVyj3M1OwZrBjfDKNtUgN9hW53iLkdyig4LqO7Tx6
	YuPwlFbs903g==
X-Google-Smtp-Source: AGHT+IGZqbW0+/S17J6RDbXZnRIU8hSK1Dmm2Um3L8P8CRvPomF8j94cwh/RTW/K/MdMyX0p0nhaJA==
X-Received: by 2002:a05:6a20:734a:b0:334:97a7:8357 with SMTP id adf61e73a8af0-34787d7d88amr2092916637.60.1761790646348;
        Wed, 29 Oct 2025 19:17:26 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712791576dsm14913433a12.12.2025.10.29.19.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 19:17:26 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:17:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy
 mode restriction
Message-ID: <td7eseq6rmc3s2ecvcjyyyn5feawjmugzb4ihjyviquro7dv44@3dosfqam6h7h>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-2-inochiama@gmail.com>
 <20251028-parka-proud-265e5b342b8e@spud>
 <rclupbdjyk67fee2lgf74k6tkf7mnjcxzwcjvyk2bohgpetqt5@toxvy3m5orm2>
 <20251029-fading-expulsion-f0911c28d23d@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-fading-expulsion-f0911c28d23d@spud>

On Wed, Oct 29, 2025 at 05:54:49PM +0000, Conor Dooley wrote:
> On Wed, Oct 29, 2025 at 08:56:09AM +0800, Inochi Amaoto wrote:
> > On Tue, Oct 28, 2025 at 07:22:37PM +0000, Conor Dooley wrote:
> > > On Tue, Oct 28, 2025 at 08:38:56AM +0800, Inochi Amaoto wrote:
> > > > As the ethernet controller of SG2044 and SG2042 only supports
> > > > RGMII phy. Add phy-mode property to restrict the value.
> > > > 
> > > > Also, since SG2042 has internal rx delay in its mac, make
> > > > only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> > > 
> > > Should this have a fixes tag?
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > 
> > Although I add a fixes tag to the driver, I am not sure whether the
> > binding requires it. But if it is required, I think it should be
> 
> Kinda depends for bindings, amending a binding for completeness probably
> doesn't need one but amending it to actually permit a functional
> configuration does. This is somewhere in-between I suppose. If a driver
> change is coming along with it which is likely to be backported, that'd
> be a vote in favour of a fixes tag here too, so that the binding and
> driver match in stable.
> 

Thank you. It is helpful for me. And in this case, it is suitable
to add this fixes tag.

Regards,
Inochi
