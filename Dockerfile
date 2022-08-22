FROM node:18-alpine
RUN apk add dumb-init
ENV NODE_ENV production
RUN adduser --system --group --no-create-home thoregon
WORKDIR /thoregon
COPY --chown=thoregon:thoregon . .
RUN npm ci --only=production
USER thoregon
CMD ["dumb-init", "node", "--experimental-loader ../evolux.modules/evolux.universe/bootloader.mjs", "protouniverse.mjs" ]
