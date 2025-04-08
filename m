Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F921A2567
	for <sophgo@lists.linux.dev>; Tue,  8 Apr 2025 02:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744079651; cv=none; b=Rb5s/3U2JUUr4B8NUsWn4Vk7gsuuLOoK8QAZT9hi3Ly5sAuRxwDShd/GIG5gvarOHsBgfSlqeadPP68x77PJOSG8zNmI8BdbMpXVrsW1WdDszqgADui7uDBC5Lgjdg7LXpYFRGQEfnbf6ES487zEbV5Dm8rZ9e3QrsnO2enYPy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744079651; c=relaxed/simple;
	bh=+hLj8ICUAAVqQQcsCRHJOsDstttPzIFItann4SgbdTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdwYM9leJ/ubrrSe3ucWlPe8NWaZthLJqRAhNBqBITbpgotUe5jK38aNAAyA6YiwIH8iKLtUGu0V9Lfq87jmjPQ5aTx1BBguZBeulfLtb+atiy6dsntxw0DPXiohbVwWZy4nMxkK2QsFrWGJZOt6KEhuYNaXajYZLBI19v7nDKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTQRovaJ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTQRovaJ"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c6a59a515aso312452285a.0
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 19:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744079649; x=1744684449; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=waaMzRcEYQgRpRjT/cb8agAmmDWkveY+/Tn+x5v2WbI=;
        b=HTQRovaJ8GmFGtC1IdLt+gbLm/lasI6ryrngEgiFZhQdpF84HcCwwvZdKielh79JJv
         gyYR6WAY7uss1asbtpPbWOfM5Sz0Hr2P7mEu4c13R0r1Fr3mvd/zDo3mAl3t/hI8sIcb
         1tUYFccMZ9ZjHBGlZjXF4GC9yY38ENMAIlw2xVe44HqNgEoEfNiGNlZXVlXf3/cdlaQm
         lftEeIXpN1SeWZi1Q/DGZxfAbTSiNRgtQUk1pUbnZUkh2kThfjLbi9D+IEWWazThGjsg
         Q5cgLQJ+7OyabISSSNwQd0dx+1YR8z5ag2UVIftZ4S0aH/JzJQtawRRhwNFkakL8xGWS
         2/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744079649; x=1744684449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waaMzRcEYQgRpRjT/cb8agAmmDWkveY+/Tn+x5v2WbI=;
        b=IkH6BK07qSLSOYorw659eeZTLUztbH8yxqgQjuuhsRRGp1V5yYS+8jRngU4wv2di8H
         EICH6P+mCSOHRmEsHqcmvQrzqNaa0ml/IpFBOkvXO9vLD9ne/gqhEqJ68RM2vRTv0XTc
         XO/8yI0yh2VIs8xHTrZwPyh7xR0wO45ftNmuEJVK6g1/+xdXMMxLGQl8NInbWsfM2lYH
         Ni7bU65OTjHP3EULkwFvnM5ds9Wt3ABPg1zgkzw7Yhk7e4sE3MLZOaZf/zbQTx01xLPe
         QTlBWLe2SIim2xASm6HPp5BTsS4eyXHg1frjafXvj981Laxu0qPxnutvM+7zDdofrpOe
         F3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkzub+eWny+X39ewES409gX6fCkMNgR0RazdVv5fh1mCvzcW5jruwnyZWGhy6nmD3W060ukE4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwqP6HJsKRWXEVjmbInZaO2DybBiAb1nuVz6Bu1l/zt8sqj0ug
	anjabzrM8IElrg0chMj2ndPsIonBe3bS2+o9WyDov2bYHqvyAbFI
X-Gm-Gg: ASbGncvwBmcpEiqYiwb/gJJKU1MTLJyVVXfweWGiu9la8+x4EuwTVWd/v5GIJubh6F1
	MmXNwkInXYvTaRfpgs6ceE25QWNz52di3l36pE01LD5qMBwziNev9jNI0kzNs1AVGWulCFlPNwZ
	xr/6mjJ96H2ssP8t+smreX0/vLuBN5J9rFXO6eFIbd7FZyVz+70/MI4EqzcTAozediI7PKyDZnv
	GSo9K+SxuPYZsS4b8ldAAehnWCeRYdBr5bKcp/BSqLQS06842qImBNptHyaZM63Gedgy0s4Xh82
	HIKTjBBAEJzEEgzTX/rv
X-Google-Smtp-Source: AGHT+IHa2pjYh5qtU2xFWFpFRw710b9YzXGj/CQhpz4LU55IzIv/AkIca8T95g1vDXO/do3EzvlTyA==
X-Received: by 2002:a05:620a:372c:b0:7c5:a5a2:eea3 with SMTP id af79cd13be357-7c775a3a33bmr1702022885a.34.1744079648872;
        Mon, 07 Apr 2025 19:34:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f14d2a7sm67012176d6.107.2025.04.07.19.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:34:08 -0700 (PDT)
Date: Tue, 8 Apr 2025 10:33:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Longbin Li <looong.bin@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, ghost <2990955050@qq.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: sophgo: add pwm controller for
 SG2044
Message-ID: <3y4nm5ievsfyomyzm35b3moj2buunwmisjowmvovhbglcjwnhi@gaj7wz4sm7tj>
References: <20250407072056.8629-1-looong.bin@gmail.com>
 <20250407072056.8629-2-looong.bin@gmail.com>
 <jq55x7uhftvejninh56tzk32jtmmwa5wxzna5uxbkk5woi7zi5@6wrg2ctmyg7b>
 <20250407141119.GA2192351-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407141119.GA2192351-robh@kernel.org>

On Mon, Apr 07, 2025 at 09:11:19AM -0500, Rob Herring wrote:
> On Mon, Apr 07, 2025 at 02:31:24PM +0200, Uwe Kleine-König wrote:
> > Hello,
> > 
> > On Mon, Apr 07, 2025 at 03:20:38PM +0800, Longbin Li wrote:
> > > diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> > > index bbb6326d47d7..e0e91aa237ec 100644
> > > --- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> > > +++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> > > @@ -17,7 +17,9 @@ allOf:
> > > 
> > >  properties:
> > >    compatible:
> > > -    const: sophgo,sg2042-pwm
> > > +    enum:
> > > +      - sophgo,sg2042-pwm
> > > +      - sophgo,sg2044-pwm
> > 
> > Given that the sg2044 has more registers (to e.g. implement different
> > polarity), but the sg2042 registers are identical, I wonder if the 2044
> > device should use:
> > 
> > 	compatible = "sophgo,sg2044-pwm", "sophgo,sg2042-pwm";
> > 
> > Note, I'm unsure here, only providing input to people who are more
> > knowledgeable in DT that I am.
> 
> Depends if s/w only understanding "sophgo,sg2042-pwm" will work on the 
> 2044. IOW, will a kernel without the driver change here work?
> 

No luck, the logic for SG2042 is broken on SG2044. In fact, it seems
to be more familiar to the pwm ip on CV1800 than it on SG2042.

Regards,
Inochi 
