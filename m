Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EE921019E
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 17:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768756079; cv=none; b=Cw24GUUxH0spqLtTn9bGXUJRntp6Khxd1svSkHwMXQcyDo0+7WNHz7NeIvTjR6SvojUx6g8NQW+XAI+Bm4KroR6q6j5ztE+gWjgZ/zgLTXP096DkzuQE5Lu/kd4isKFruAU/hTLC9au3JZ9Z1tW2JgPPOoPMuNzW2d7Pl/bn0i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768756079; c=relaxed/simple;
	bh=wqJVTf+gmqQxz2b5iZXHl+d4EPQymaMDdRoZo/w/TXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBLaSEUlZRj78MrHJIhu5+YK/ypcoNYEeR9OTBxES3y2LED6ZQG5Qs82+KvwTDfP2XbkCw2JTWlxHgmwVVJBN6IW65nFsXIYeJatWG6w8ZCtewAEErn4HDomEmDqoJxWmbiO5g7hvlbssX2AYDtt7dtW5z4V+OAf79tiW1wy/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYCLn/ki; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYCLn/ki"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so40861585e9.0
        for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 09:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768756077; x=1769360877; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzZkrvjzl8CZXzuYp4FhKjj0g1M3FRzGDlc7LV5XfLI=;
        b=nYCLn/kiShLmny4KdambLwLm80gAPCiWNMBroO5Aak0kfK7IDyWdudiSrcBAV1MwA8
         ZDEoRerccy69Eg2I8s5n4hRdPy1azKFjL58S7S8ND9w7eDl6z6/Gbz387Wjq/Bg/8WNM
         eLaWSmgpsghJ0LUT8AVwDreWj+LCz7yO+7R1BmADHUDbrYVOo/NpL1QKxyMPJmCwfMuW
         a1U+QbIhPNPaRqFnt2SxMULJvHjMYDBO+xLM5NIEltFk+We0QcxA+jJtpVrnS8+9ZaB9
         N6YdMUsodEnIijeggTNwZRFlV1SeltXIuLh4IFMekey0RQQIFXn+fLmVeGYWdfxV3bnQ
         QTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768756077; x=1769360877;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LzZkrvjzl8CZXzuYp4FhKjj0g1M3FRzGDlc7LV5XfLI=;
        b=PcYxKpLXgG7mdQ9JoDdFMjZgQs/xTf4wyY0DCgUgeulkpBbn597/gClkqyFrNCEgqs
         GUdBZtR46ZhA7zyiIb7bVFQqLEi4ZKgMGvIOTjh+EJwm4Q/6dh3hyIqmO5gvvYs78mLL
         GXnWmHuSXuEJleHMLG58UcIl7KTaDspZXZXRqgquPeARJqH2yt85E9lK2FKfq0nrSBUi
         gPjEoaAr+Ru0KAuhs3RxCGRvaJG8NaUADyW9nCayn1XHRz1XOczltkznQnyVOjUtSh9X
         +o6PlV/MWYT6MwTJBy2qHdEX6SW9cQkXjP35ytzmzmYvIuQ5KVVbda0l1SEs0RcDO8yI
         BJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdH96a1YCJAomRaHP5KMng3GKBOgqRtCTn2i2RT2IvuV/vu6EYp91he5v68AzSQkUHhcQOZ38=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ88ErR1LENATODrcC8s80ITJESzWuFGUJfOPzHkUSMYI6hZCY
	UVzrnnPlz0l+K5rC15cAnyVqomHqAPAxpmgMCEqpVioMXw64qxmaniLt
X-Gm-Gg: AY/fxX5ugxsz5cZnZ8yROYRADBZ4YGloR1TZjDrPmvs3tg4Z5SrzGKaae6vYTR01/Rx
	ieW0lAljZd/CGXzXzMuzBknVBbArvWj0K2ZM1dlY878tZg0rILD/93tGaxwP9QpGil4tnKw3Md3
	JUeMzzYdYAKF0yPa6goJTSjxrJeYt8jNB4H+jPLcyIG1S8flcHbeTU/5Nkw1i7S6JcI3apocqtB
	FHRSkIc8DFcoE15EQOCXGhiGBItktGHsBbECjEOiZMItHfW7M/gn7j0KOW9hqnopkufM5ODSOY8
	ozuwDLnKUC2d7WoJeCz3piX5OWffuZc1kc93NmfXVMHh99XbYlcmJar+xieAYztLLpOvrU89Mh5
	Fta+HT7biXZ2atBEaMTuWZUOBqJBRVfwnNHuG+ek+k+0tYO7VKqg9mv1nId/KWdgptNz6dryGA3
	SzbQhRNH5EQS7b2uO4omkGWbOzn6uugf2V9xopGb6DCUI=
X-Received: by 2002:a05:600c:4e93:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-4801e30b737mr113177375e9.12.1768756076408;
        Sun, 18 Jan 2026 09:07:56 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe03b56sm66590995e9.4.2026.01.18.09.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 09:07:56 -0800 (PST)
Date: Sun, 18 Jan 2026 21:07:51 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <aW0SikDtd0HIrT4v@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
 <20260118-famous-magnificent-peccary-474ba8@quoll>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-famous-magnificent-peccary-474ba8@quoll>

On Sun, Jan 18, 2026 at 11:14:34AM +0400, Krzysztof Kozlowski wrote:
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

dt-bindings: sound: sophgo,cv1800b: add I2S/TDM controller

Is this anyhow better? Also in the documentation directory should go
first but I didn't find such examples in git follow. 

Thanks. 

